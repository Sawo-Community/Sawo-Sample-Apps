//
//  LoginViewController.swift
//  FrameworkV1
//
//  Created by Rhytthm Mahajan on 10/12/20.
//

import UIKit
import WebKit
import LocalAuthentication
//import SwiftKeychainWrapper

public class LoginViewController: UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!
    
    // values we get from client
    var Identifiers = ""
    var Key = ""
    var Secret = ""

   // values made if user hasn't logged in once
    var publicKEY = ""
    var privateKEY = ""
    var sessionID = ""
    
    // values coming from App
    var keychainPublicKEYF = ""
    var keychainPrivateKEYF = ""
    var keychainSessionIDF = ""
    
    
    private func setupWebView() {
        
        var script = ""
        // checking if keys were saved in keychain or not and sending value to web sdk
        if keychainPublicKEYF.isEmpty && keychainPrivateKEYF.isEmpty {
            print("keyValue is empty.")
            script =  """
                      window.test = function() {return false}
                      """
            
        }else{
            print("keyValue is not empty.")
//            script =  """
//                      window.test = function() {return true}
//                      """
            script = """
                        alert("Hello World")
                    """
        }
        
        print("Script is - \(script)")
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)

        let contentController = WKUserContentController()
        contentController.addUserScript(userScript)
        contentController.add(self, name: "payloadCallback")

        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        self.webView = WKWebView(frame: self.view.bounds, configuration: config)
        
    }
    
    // getting values from notice centre
    @objc func productKey(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
               {
                    for (key, password) in data
                    {
                        Key = password
                        print("\(key) : \(password) ")
                    }
            }

    }
    @objc func identifierType(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
                {
                    for (identifier, Type) in data
                    {
                        Identifiers = Type
                        print("\(identifier) : \(Type) ")
                    }
            }
                
    }
    @objc func SecretKey(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
               {
                    for (SecretKey, password) in data
                    {
                        Secret = password
                        print("\(SecretKey) : \(password) ")
                    }
            }

    }
    @objc func keychainPuK(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
               {
                    for (keychainPuKey, keyPuk) in data
                    {
                        keychainPublicKEYF = keyPuk
                        print("Setting keychainPublicKEYF value we get from the APP \(keychainPuKey) : \(keyPuk) ")
                        print(keychainPublicKEYF)
                    }
            }

    }
    @objc func keychainPrK(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
               {
                    for (keychainPrKey, keyPrK) in data
                    {
                        keychainPrivateKEYF = keyPrK
                        print("\(keychainPrKey) : \(keyPrK) ")
                    }
            }

    }
    @objc func keychainSess(_ notification: Notification){

            if let data = notification.userInfo as? [String: String]
               {
                    for (keychainSessKey, keysess) in data
                    {
                        keychainSessionIDF = keysess
                        print("\(keychainSessKey) : \(keysess) ")
                    }
            }

    }
  
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Calling values from the App using notice Centre
        NotificationCenter.default.addObserver(self, selector: #selector(productKey(_:)), name: Notification.Name("ProductKey"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(identifierType(_:)), name: Notification.Name("IdentifierType"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(SecretKey(_:)), name: Notification.Name("SecretType"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keychainPuK(_:)), name: Notification.Name("keychainPuKFramework"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keychainPrK(_:)), name: Notification.Name("ProductKeyFramework"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keychainSess(_:)), name: Notification.Name("keychainSessFramework"), object: nil)
        
        print("Login View Controller View did load ")
        print("Product Key- \(Key)")
        print("Identifier- \(Identifiers)")
        print("keychainPublicKEY is \(keychainPublicKEYF)")
        print("keychainPrivateKEY is \(keychainPrivateKEYF)")
        print("keychainSessionID is \(keychainSessionIDF)")
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Sets up WK webView
        self.setupWebView()
        
        self.view.addSubview(self.webView)
        let Url = "https://websdk.sawolabs.com/?apiKey=\(Key)&identifierType=\(Identifiers)&webSDKVariant=ios&apiKeySecret=\(Secret)"
        print(Url)
        
        if let url = URL(string: Url) {
        let request = URLRequest(url: url)
        self.webView.load(request)
        
        }
    }
}


extension LoginViewController: WKScriptMessageHandler {
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "payloadCallback" {
            print("JavaScript is sending a message \(message.body)")
            let s = String(describing: message.body)
            let accessWords = "true,"
            let payloadWords = "user_id"
            let buttonClicked = s.contains(accessWords)
            let payloadSuccessful = s.contains(payloadWords)
            print(payloadSuccessful)
//            print(s.contains(accessWords))
            if buttonClicked == true{
                print(s)
            let str = s
            let strArray = str.split(separator: ":", maxSplits: 2)

            let keyArray = strArray[2].split(separator: ",",maxSplits: 3)

            let Public = keyArray[0].replacingOccurrences(of: "{", with: "", options: .literal, range: nil)
            let PublicArray = Public.split(separator: ":")
            let publicKey = PublicArray[1]

            let Private = keyArray[1].replacingOccurrences(of: "}", with: "", options: .literal, range: nil)
            let PrivateArray = Private.split(separator: ":")
            let privateKey = PrivateArray[1]

            let session = keyArray[2]
            let sessionArray = session.split(separator: ":")
            let sessionId = sessionArray[1]

            let test = keyArray[3].replacingOccurrences(of: "}", with: "", options: .literal, range: nil)
            let testArray = test.split(separator: ":")
            let testValue = testArray[1]

            print("After decripting the public key is \(publicKey)")
            print("After decripting the private key is \(privateKey)")
            print("After decripting the session ID is \(sessionId)")
            print("After decripting the Test Value is \(testValue)")
            
            // Setting the values of the variables to Global Variables
            self.publicKEY = String(publicKey)
            self.privateKEY = String(privateKey)
            self.sessionID = String(sessionId)
            
            print("printing publicKey\(self.publicKEY)")
            print("printing privateKey\(self.privateKEY)")
            
            // Posting the Global varibles values to the app using Notification Centre
            let publicKEYS = ["publickey": "\(self.publicKEY)"]
            NotificationCenter.default.post(name: Notification.Name("publickey"), object: nil,userInfo: publicKEYS)
            let privateKEYS = ["privatekey": "\(self.privateKEY)"]
            NotificationCenter.default.post(name: Notification.Name("privatekey"), object: nil,userInfo: privateKEYS)
            let sessionIDs = ["publickey": "\(self.sessionID)"]
            NotificationCenter.default.post(name: Notification.Name("sessionId"), object: nil,userInfo: sessionIDs)
            }
            // Capturing Button Clicked Response and initiating FTID on its response
            if buttonClicked == true{
                NotificationCenter.default.post(name: Notification.Name("loginButtonPressed"), object:nil )
                let context:LAContext = LAContext()
                if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil){
                    context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Message") { (good, error) in
                        if good{
                            print("good")
                        }else{
                            print("try again")
                            DispatchQueue.main.async {
                                self.webView.reload()
                            }
                            
                        }
                    }
                }
           }
            if payloadSuccessful == true{
            NotificationCenter.default.post(name: Notification.Name("LoginApproved"), object: nil)
            let Payload = ["UserPayload": s]
            NotificationCenter.default.post(name: Notification.Name("PayloadOfUser"), object: nil,userInfo: Payload)
            print("payload was successfully reached")
            }
            
        }
    }
    
    
}

