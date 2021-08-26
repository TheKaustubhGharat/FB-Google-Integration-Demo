//
//  ViewController.swift
//  FB&Google Integration Demo
//
//  Created by GCO on 26/08/21.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var btnFacebook: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }else{
            
            btnFacebook.permissions = ["public_profile", "email"]
            btnFacebook.delegate = self
        }
        
        
        
    }
    
}
extension ViewController:LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { connection, result, error in
            print("\(result)")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        <#code#>
    }
    
}
