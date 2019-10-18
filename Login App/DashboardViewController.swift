//
//  DashboardViewController.swift
//  Login App
//
//  Created by Adegoke Ayomikun on 16/10/2019.
//  Copyright © 2019 Dev mikzy. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import GoogleSignIn


class DashboardViewController: UIViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     @IBAction func logoutClicked(_ sender: Any) {
        if((GIDSignIn.sharedInstance()?.hasPreviousSignIn())!){
             GIDSignIn.sharedInstance().signOut()
        }else{
              LoginManager().logOut()
        }
        navigateToLogin()
     }
    
    func navigateToLogin()  {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVc") as? ViewController{
            present(vc, animated: true, completion: nil)
        }
    }
 
}
