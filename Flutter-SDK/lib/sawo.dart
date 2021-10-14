import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:uuid/uuid.dart';

/// The Sawo class
class Sawo {
  /// The parameters `apiKey` and `secretKey` must not be null.
  Sawo({
    required this.apiKey,
    required this.secretKey,
  });

  /// Put your API KEY in `apiKey`
  final String apiKey;

  /// Put your SECRET KEY in `secretKey`
  final String secretKey;

  late String identifierType;

  /// Call `signIn` function for showing signIn form
  ///
  /// `identifierType` should be either 'email' or 'phone_number_sms'
  ///
  /// When the user is successfully verified, the `callback` method will get invoked with the payload containing the userID and other information. If something went wrong, it will return no values.
  signIn({
    required BuildContext context,
    required String identifierType,
    callback,
  }) async {
    identifierType = identifierType;

    /// Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewContainer(
          apiKey: apiKey,
          secretKey: secretKey,
          navContext: context,
          identifierType: identifierType,
        ),
      ),
    );

    callback(context, result);
  }
}

/// For creating Webview of SAWO Login form
class WebViewContainer extends StatefulWidget {
  final String apiKey;
  final String secretKey;
  final String identifierType;
  final BuildContext navContext;

  WebViewContainer({
    required this.apiKey,
    required this.secretKey,
    required this.navContext,
    required this.identifierType,
  });
  @override
  createState() => _WebViewContainerState(
        apiKey: apiKey,
        secretKey: secretKey,
        navContext: navContext,
        identifierType: identifierType,
      );
}

class _WebViewContainerState extends State<WebViewContainer> {
  late String apiKey;
  late String secretKey;
  late String identifierType;
  late BuildContext navContext;

  var _webviewKey = UniqueKey();

  // webview constants
  var _webviewURL;
  var _eventPrefix;
  late WebViewController _controller;

  bool isPageLoading = true;
  bool isError = false;

  _WebViewContainerState({
    required this.apiKey,
    required this.secretKey,
    required this.navContext,
    required this.identifierType,
  });

  /// For checking the internet connection
  void checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      print("Internet connection not available");
      ScaffoldMessenger.of(navContext).showSnackBar(
        SnackBar(content: Text("No Internet")),
      );
      Timer(Duration(seconds: 3), () {
        Navigator.of(navContext).pop("");
      });
    }
  }

  @override
  void initState() {
    _eventPrefix = Uuid().v1();
    var url = "https://websdk.sawolabs.com/?eventPrefix=$_eventPrefix";
    _webviewURL = url;
    super.initState();
    checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: WebView(
                    key: _webviewKey,
                    initialUrl: _webviewURL,
                    javascriptMode: JavascriptMode.unrestricted,
                    javascriptChannels: Set.from([
                      JavascriptChannel(
                          name: 'messageHandler',
                          onMessageReceived: (JavascriptMessage message) {
                            var _payload = message.message;
                            Navigator.pop(navContext, _payload);
                          }),
                    ]),
                    onWebViewCreated: (WebViewController webviewController) {
                      _controller = webviewController;
                    },
                    onPageStarted: (String url) {
                      setState(() {
                        isPageLoading = true;
                      });
                      _controller.evaluateJavascript(_postJSMessage());
                    },
                    onPageFinished: (String url) {
                      if (!isError) {
                        setState(() {
                          isPageLoading = false;
                        });
                      }
                    },
                    onWebResourceError: (error) {
                      print(error.description);
                      ScaffoldMessenger.of(navContext).showSnackBar(
                        SnackBar(content: Text("No Internet")),
                      );
                      setState(() {
                        isError = true;
                        isPageLoading = true;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          /// Showing `CircularProgressIndicator` according to the loading state
          (isPageLoading)
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()))
              : Container(height: 0, width: 0),
        ],
      ),
    );
  }

  String _postJSMessage() {
    var _eventLoadConfig = _eventPrefix + "LOAD_CONFIG";
    var _eventLoadSuccess = _eventPrefix + "LOAD_SUCCESS";
    var _eventLoginSuccess = _eventPrefix + "LOGIN_SUCCESS";
    var script = '''
      window.addEventListener('message', function(e) {
        switch(e.data.event){
          case '$_eventLoadSuccess':
            window.postMessage({
              event: '$_eventLoadConfig',
              payload: {
                identifierType: '$identifierType',
                apiKey: '$apiKey',
                secretKey: '$secretKey'
              }
            }, '*');
            break;

          case '$_eventLoginSuccess':
            if (messageHandler?.postMessage) messageHandler.postMessage(JSON.stringify(e.data.payload))
            break;

          default:
            console.log('SAWO: default swtich case ', JSON.stringify(e.data))
        }
      });
    ''';
    return script;
  }
}
