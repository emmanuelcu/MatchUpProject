//
//  LoginViewController.swift
//  MatchUpProject
//
//  Created by Emmanuel Cuevas on 1/26/16.
//  Copyright © 2016 Emmanuel Cuevas. All rights reserved.
//

import UIKit
import Parse
import FBSDKLoginKit
import ParseFacebookUtilsV4


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile","email"]) { (user:PFUser?, error:NSError?) -> Void in
            if (error != nil){
                //Display the alert message
                
                let myAlert = UIAlertController(title: "Log In Error", message: "There was an error while you tried to login", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                myAlert.addAction(okAction)
                self.presentViewController(myAlert, animated: true, completion: nil)
                
                return
                
            }
            
            print(user)
            print("Current user token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
            
            print("Current user ID =\(FBSDKAccessToken.currentAccessToken().userID)")
            

            
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
