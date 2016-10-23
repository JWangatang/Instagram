//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Jonathan Wang on 10/22/16.
//  Copyright © 2016 JonathanWang. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!

    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayErrorMessage (s: String) {
        errorLabel.text = s;
    }
    
    @IBAction func signUp(sender: AnyObject) {
        if(emailTF.text != "" && usernameTF.text != "" && passwordTF.text != "" && confirmPasswordTF != ""){
            if(passwordTF.text == confirmPasswordTF.text){
                let newUser = PFUser()
                            
                // set user properties
                newUser.username = usernameTF.text
                newUser.email = emailTF.text
                newUser.password = passwordTF.text
                            
                // call sign up function on the object
                newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if let error = error {
                        self.displayErrorMessage(error.localizedDescription)
                    } else {
                        print("User Registered successfully")
                        self.performSegueWithIdentifier("signup", sender: nil)
                        
                    // manually segue to logged in view
                    }
                }
            } else{
               self.displayErrorMessage("Passwords do not match")
            }
        } else{
            self.displayErrorMessage("Missing information.")
        }
    }

    @IBAction func hideKeyboard(sender: AnyObject) {
        sender.resignFirstResponder()
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
