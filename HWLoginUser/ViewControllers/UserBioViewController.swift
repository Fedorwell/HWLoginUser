//
//  UserBioViewController.swift
//  HWLoginUser
//
//  Created by mac on 14.05.2023.
//

import UIKit

final class UserBioViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var bio: String!
    var fullName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(fullName ?? "")"
        bioLabel.text = bio
    }
}
