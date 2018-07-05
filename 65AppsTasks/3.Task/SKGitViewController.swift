//
//  SKGitViewController.swift
//  65AppsTasks
//
//  Created by Sergey Kharitonov on 04.07.2018.
//  Copyright © 2018 Sergey Kharitonov. All rights reserved.
//

import UIKit
import Alamofire

let kGitHTTPBaseURL = "https://api.github.com/"

class SKGitViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func touchUpInsideSearchRepos(_ sender: Any) {
        Alamofire.request("\(kGitHTTPBaseURL)users/\(nicknameTextField.text!)/repos").validate().responseJSON { response in
            switch response.result {
            case .success:
                self.printRepos(response: response.result.value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func printRepos(response object:Any?){
        let jsonArray = object as! NSArray
        for buf:Any in jsonArray {
            let dict = buf as! NSDictionary
            print("\(dict["name"] as! String)")
            
        }
    }
    
}
