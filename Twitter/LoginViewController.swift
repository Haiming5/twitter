//
//  LoginViewController.swift
//  Twitter
//
//  Created by Haiming Wu on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "UserLoggedIn") == true{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: "https://api.twitter.com/oauth/request_token", success: {
            
            UserDefaults.standard.set(true, forKey: "UserLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("wrong")
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
