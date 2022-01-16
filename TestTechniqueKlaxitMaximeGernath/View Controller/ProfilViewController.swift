//
//  ProfilViewController.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import Foundation
import UIKit

class ProfilViewController: UIViewController {
    @IBOutlet weak var UserImageView: CircularImageView!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var EntrepriseTextField: UITextField!
    @IBOutlet weak var ProfessionTextField: UITextField!
    @IBOutlet weak var AdressTextField: UITextField!

    var currentTappedTextField : UITextField?

    // Get the json info at the first launch of the app and then get the KeychainStorage one if the informations
    // are modified
    var userInfo: UserInfo = KeychainStorage.getUserInfo() ?? Bundle.main.decode("account.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        AdressTextField.delegate = self
        PhoneTextField.delegate = self
        EntrepriseTextField.delegate = self
        ProfessionTextField.delegate = self
        
        fillProfilView(userInfo: userInfo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(userInfo.adress ?? "")
        AdressTextField.text = userInfo.adress ?? nil
    }
}

extension ProfilViewController: UITextFieldDelegate {
    
    // Check if the AdressTextField is clicked to change current view into searchView
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTappedTextField = textField
        
        if currentTappedTextField == AdressTextField {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "searchAdressView") as! ViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        }
        
        return true
    }
    
    // Check what textfield is selected to save the right data at the right place
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch currentTappedTextField {
        case PhoneTextField:
            userInfo.phone_number = textField.text ?? ""
        case EntrepriseTextField:
            userInfo.company = textField.text ?? ""
        case ProfessionTextField:
            userInfo.job_position = textField.text ?? ""
        default:
            print("Unknow text field")
        }
        // Save the new dataModel with KeychainStorage
        if KeychainStorage.saveuserinfo(userInfo) {
            print("user info saved")
        } else {
            print("fail to save user info")
        }
        
        self.view.endEditing(true)
        return false
    }

}

extension ProfilViewController {
    func fillProfilView(userInfo: UserInfo) {
        UserImageView.downloaded(from: userInfo.picture_url)
        UsernameLabel.text = "\(userInfo.first_name) \(userInfo.last_name)"
        PhoneTextField.text = userInfo.phone_number
        EntrepriseTextField.text = userInfo.company
        ProfessionTextField.text = userInfo.job_position
        AdressTextField.text = userInfo.adress ?? nil
    }
}
