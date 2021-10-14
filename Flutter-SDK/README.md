# Sawo

Passwordless and OTP-less Authentication for your website and app. It helps you to authenticate user via their email or phone number.

## Getting Started

- [Documentation](https://docs.sawolabs.com/sawo/hybrid/flutter)
- [Developer dashboard](https://dev.sawolabs.com/)

To get started, you can [create a free account at SAWO](https://dev.sawolabs.com/) to get your API keys.

## Installing

A step by step series of examples that tell you how to get a development env running. These instructions will let you render the form in your specified container, and allow you to attach successful login callback for futher actions.

#### Add the plugin in dependencies

```
dependencies:
  sawo: ^0.1.2
```

#### Install the plugin, by running mentioned command

```
flutter pub get
```

#### Import the plugin into class

```
import 'package:sawo/sawo.dart';
```

#### Create API Key

- Login to sawo [dev console.](https://dev.sawolabs.com/)
- Create a new project
  - Select Hybrid and then select Flutter under that section
  - Set Project Name
- Copy your API key & Secret Key from the file which has been downloaded automatically.

#### Requirements

- In [project]/android/app/build.gradle set minSdkVersion to >= 19

#### Create a Sawo Instance

```dart
    Sawo sawo = new Sawo(
        apiKey: <YOUR-API-KEY>,
        secretKey: <YOUR-Secret-Key>,
     );
```

**_NOTE: It is always recommended to store your apiKey and secretKey in a .env file. Otherwise, create a separate .dart file and add it to the .gitignore. Just make sure that you are not exposing the keys publicly and also add them to the .gitignore before pushing the project to a public repo._**

#### Redirect User to login page

- sawo provides two ways to authenticate user, one by email and one by phone number.

```dart
  // sawo object
  Sawo sawo = Sawo(
    apiKey: "Your API Key",
    secretKey: "Your Secret key",
  );

  // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UserData :- $user"),
            ElevatedButton(
              onPressed: () {
                sawo.signIn(
                  context: context,
                  identifierType: 'email',
                  callback: payloadCallback,
                );
              },
              child: Text('Email Login'),
            ),
            ElevatedButton(
              onPressed: () {
                sawo.signIn(
                  context: context,
                  identifierType: 'phone_number_sms',
                  callback: payloadCallback,
                );
              },
              child: Text('Phone Login'),
            ),
          ],
        ),
      ),
    );
  }
```

When the user is successfully verified, the callback method will get invoked with the payload containing the userID and other information. It will return empty payload for unsuccessful verification.

## [Sawo Example Project](https://pub.dev/packages/sawo/example)

## Authors

- [SAWO Labs](https://github.com/sawolabs)

## License

This project is licensed under the BSD-3-Clause License
