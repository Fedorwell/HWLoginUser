//
//  WelcomeViewController.swift
//  HWLoginUser
//
//  Created by mac on 10.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var hellowUserField: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var hellowUserValue: String!
    let clearField = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hellowUserField.text = "Hello, \(hellowUserValue!)!"
        
        logoutButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func logoutButtonTapped() {
        dismiss(animated: true)
        
    }
    
}





