//
//  LogInViewController.swift
//  Instagram
//
//  Created by Jonathan Wang on 10/22/16.
//  Copyright © 2016 JonathanWang. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(usernameTF.text!, password: passwordTF.text!) { (user: PFUser?, error: NSError?) in
            if user != nil{
                self.performSegueWithIdentifier("signin", sender: nil)
            }
            else{
                print(error?.localizedDescription)
            }
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
