//  ViewController.swift
//  Login App
//
//  Created by Adegoke Ayomikun on 08/10/2019.
//  Copyright © 2019 Dev mikzy. All rights reserved.
//
import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin

class ViewController: UIViewController,GIDSignInDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var fbookBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.customizeTextField(iconName: "username")
        passwordTextField.customizeTextField(iconName: "password")

        GIDSignIn.sharedInstance().clientID = "940172268211-assdkj5k6g2sidm8dne2m1gok089ms6c.apps.googleusercontent.com"

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //setGradientBackground()
        super.viewWillAppear(animated)
        loginButton.customizeButtonWithRoundedCorners()
        googleBtn.customizeButtonWithRoundedCorners()
        fbookBtn.customizeButtonWithRoundedCorners()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if((GIDSignIn.sharedInstance()?.hasPreviousSignIn())!){
            navigateToDashboard()
        }else if (AccessToken.isCurrentAccessTokenActive){
            navigateToDashboard()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let idToken = user.authentication.idToken // Can send to the server/Keep
        navigateToDashboard()
    }
    
    //facebook login
    @IBAction func fbLoginBtnClicked(_ sender: Any) {
        LoginManager().logIn(permissions: ["email", "public_profile"], from: self) { result, error in
            if error != nil {
                print(error ?? "FB login failed")
                return
            }
            //no errors navigate to main page
            self.navigateToDashboard()
        }
    }
    
    //google login
    @IBAction func googleSignInClicked(_ sender: Any) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 237.0/255.0, green: 127.0/255.0, blue: 106.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 233.0/255.0, green: 81.0/255.0, blue: 98.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.contentView.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func navigateToDashboard(){
        performSegue(withIdentifier: "gotoDashboard", sender: nil)
    }
}

