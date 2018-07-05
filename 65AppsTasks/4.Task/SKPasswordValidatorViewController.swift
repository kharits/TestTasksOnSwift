//
//  SKPasswordValidatorViewController.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 04.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit

class SKPasswordValidatorViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func validateLogin(login:String) -> Bool {
        
        if login.count < 3 || login.count > 32 {
            return false
        }
        
        let firstSymbolRegEx = "[A-Za-z]"
        let firstSymbolPredicate = NSPredicate(format:"SELF MATCHES %@", firstSymbolRegEx)
        let firstSymbolIndex = login.index (login.startIndex, offsetBy: 0)
        
        if firstSymbolPredicate.evaluate(with:  String(login[firstSymbolIndex])) {
            let emailRegEx = "[A-Z0-9a-z.-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            if emailPredicate.evaluate(with: login){
                return true
            }else{
                let nickRegEx = "[A-Z0-9a-z.-]{3,32}"
                let nickPredicate = NSPredicate(format:"SELF MATCHES %@", nickRegEx)
                if nickPredicate.evaluate(with: login){
                    return true;
                }else{
                    return false;
                }
                
            }
        }else{
            return false
        }
    }

    @IBAction func touchUpInsideCheckLogin(_ sender: Any) {
        
        if  validateLogin(login: self.loginTextField.text!) {
            self.resultLabel.text = "Valid"
        }else{
            self.resultLabel.text = "Not valid"
        }
        
    }
}
