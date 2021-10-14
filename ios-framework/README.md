# ios-framework
iOS framework to integrate the sawo-sdk in iOS applications
# SawoFramework

## Steps to integrate Sawo iOS Framework 
1. Login to sawo dev console - [dev.sawolabs.com](http://dev.sawolabs.com) 
   
2. Create a new project and copy the API key and Secret key.

3. SawoFramework is available through [CocoaPods](https://cocoapods.org). 

4. Create a new Xcode Project with a View Controller and create a login button and its action in the ViewController.swift file.

5. Open your project folder in terminal and type in 'pod init', then open the pod file of your project and add the following line to the pod file and save it.
```
pod 'SawoFramework'
pod 'SwiftKeychainWrapper' 

```
6. Now go back to the terminal and type pod install to install the pod to your project. Once the pod has been installed xcworkspace file of your project and work on it.

7. Import the Framework and pod by adding following code.
```
import UIKit
import SawoFramework
import SwiftKeychainWrapper

```

6. Add the following snippet above viewDidLoad func 
```
let VC = SawoFramework.LoginViewController()
var PayloadApi = ""

var publicKeyApp = ""
var privateKeyApp = ""
var sessionIdApp = ""
    
var keychainPublicKEY = KeychainWrapper.standard.string(forKey: "publicKEY")
var keychainPrivateKEY = KeychainWrapper.standard.string(forKey: "privateKEY")
var keychainSessionID = KeychainWrapper.standard.string(forKey: "sessionID")

```

7. Add the following code snippet in your @IBAction func of the button
```
present(VC, animated: true, completion: nil)
let apiKey = ["apikey": "ADD-YOUR-API-KEY"]
let identifierType = ["identifier": "ADD-YOUR-IDENTIFIER"]
let secretKey = ["secretkey": "ADD-YOUR-SECRET-KEY"]
let keychainPuK = ["keychainPuk": "\(String( keychainPublicKEY ?? "not found any"))"]
let keychainPrK = ["keychainPrk": "\(String( keychainPrivateKEY ?? "not found any"))"]
let keychainSess = ["keychainSess": "\(String( keychainSessionID ?? "not found any"))"]

NotificationCenter.default.post(name: Notification.Name("ProductKey"), object: nil,userInfo: apiKey)
NotificationCenter.default.post(name: Notification.Name("IdentifierType"), object:nil, userInfo: identifierType)
NotificationCenter.default.post(name: Notification.Name("SecretType"), object:nil, userInfo: secretKey)
NotificationCenter.default.post(name: Notification.Name("keychainPuKFramework"), object: nil,userInfo: keychainPuK)
NotificationCenter.default.post(name: Notification.Name("ProductKeyFramework"), object: nil,userInfo: keychainPrK)
NotificationCenter.default.post(name: Notification.Name("keychainSessFramework"), object: nil,userInfo: keychainSess)

```
8. The following code in viewDidLoad func 
```
NotificationCenter.default.addObserver(self, selector: #selector(LoginIsApproved(_:)), name: Notification.Name("LoginApproved"), object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(loginCONTENTapi(_:)), name: Notification.Name("PayloadOfUser"), object: nil)

NotificationCenter.default.addObserver(self, selector: #selector(PublicKEYApp(_:)), name: Notification.Name("publickey"), object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(PrivateKEYApp(_:)), name: Notification.Name("privatekey"), object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(SessionIDApp(_:)), name: Notification.Name("sessionId"), object: nil)

```
9. Add a new View Controller to which you want to take your user after login. Create a Segue to this  View Controller and select its type as present modally. Inside Attributes inspector in presentation select full screen and give the segue a name in identifier.

10. Add the snippet below  viewDidLoad func
```

@objc func LoginIsApproved(_ notification: Notification){
    print("Login was Successful")
    self.dismiss(animated: true, completion: nil)
    performSegue(withIdentifier: "Sawo", sender: nil)
    

}


@objc func loginCONTENTapi(_ notification: Notification){
    if let data = notification.userInfo as? [String: String]
        {
            for (UserPayload, Content) in data
            {
                PayloadApi = Content
                print("\(UserPayload) : \(Content) ")
            }
    }

}

@objc func PublicKEYApp(_ notification: Notification){
    if let data = notification.userInfo as? [String: String]
        {
            for (PublicKEYApps, valuePublic) in data
            {
                publicKeyApp = valuePublic
                //print("\(PublicKEYApps) : \(valuePublic) ")
                KeychainWrapper.standard.set(valuePublic, forKey: "publicKEY")
            }
    }
}

@objc func PrivateKEYApp(_ notification: Notification){
    if let data = notification.userInfo as? [String: String]
        {
            for (PrivateKEYApps, valuePrivate) in data
            {
                privateKeyApp = valuePrivate
                //print("\(PrivateKEYApps) : \(valuePrivate) ")
                KeychainWrapper.standard.set(valuePrivate, forKey: "privateKEY")
            }
    }
}

@objc func SessionIDApp(_ notification: Notification){
    if let data = notification.userInfo as? [String: String]
        {
            for (SessionIDApps, valueSessionID) in data
            {
                sessionIdApp = valueSessionID
                //print("\(SessionIDApps) : \(valueSessionID) ")
                KeychainWrapper.standard.set(valueSessionID, forKey: "sessionID")
            }
        
    }
    

}

}


```
11. Add values to the places marked in comments.

12. PayloadApi variable contains the user's payload.

## Author

SAWO

## License

SawoFramework is available under the MIT license. See the LICENSE file for more info.



