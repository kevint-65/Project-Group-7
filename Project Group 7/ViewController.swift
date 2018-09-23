//
//  ViewController.swift
//  Project Group 7
//
//  Created by Johnny Sun on 9/19/18.
//  Copyright © 2018 Johnny Sun. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var PasswordInput: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    var UserProfileRecord = CKRecord(recordType: "UserProfile")
    override func viewDidLoad() {
        UserProfileRecord.setValue("Johnny", forKey: "Admin1")
        UserProfileRecord.setValue("Kevin", forKey: "Admin2")
        print(UserProfileRecord.recordID)
        print("All Keys: ", UserProfileRecord.allKeys())
        print("All Tokens: ", UserProfileRecord.allTokens())
    }
    @IBAction func Login(_ sender: UIButton) {
        var U_check = UserInput.text ?? "nada"
        var P_check = PasswordInput.text ?? "nada"
        if (UserProfileRecord.value(forKey: P_check) != nil) {
            var X:String = UserProfileRecord.value(forKey: P_check) as! String
            if X == U_check{
                    print("match")
                let storyboard = UIStoryboard(name: "MainMenu", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "MainMenu") as UIViewController
                present(vc, animated: true, completion: nil)
                }
            else{
                print("Wrong combo")
            }
                }
    }
    
}
