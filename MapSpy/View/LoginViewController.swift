//
//  LoginViewController.swift
//  MapSpy
//
//  Created by Igor Shevchenko on 1/11/18.
//  Copyright © 2018 Igor Shevchenko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func go(_ sender: Any) {
        
        let viewcontroller = MapViewController()
        
        self.navigationController?.pushViewController(viewcontroller, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        if textField == loginTextField {
            if loginTextField.text != nil && loginTextField.text?.lengthOfBytes(using: .utf8) != 0 {
                
                passwordTextField.becomeFirstResponder()
            }
            else {
                
            }
        }
        else {
        
            if passwordTextField.text != nil && passwordTextField.text?.lengthOfBytes(using: .utf8) != 0 {
                
                button.isEnabled = true
                return true
            }
        }
        
        
       
        
        return false
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
