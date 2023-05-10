//
//  WelcomeViewController.swift
//  HWLoginUser
//
//  Created by mac on 10.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var hellowUserField: UILabel!
    
    var hellowUserValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hellowUserField.text = "Hello, \(hellowUserValue!)!"
    }
    

    @IBAction func logoutButtonTapped() {
        dismiss(animated: true)
    }
    
}
