//
//  UserViewController.swift
//  HWLoginUser
//
//  Created by mac on 14.05.2023.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var professionLabel: UILabel!
    @IBOutlet var filmsLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    
    @IBOutlet var userImageView: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(person.name) \(person.lastname)"
        setLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userBioVC = segue.destination as? UserBioViewController
        guard let userBioVC else { return }
        
        userBioVC.bio = person.biography
        userBioVC.fullName = "\(person.name) \(person.lastname)"
        
    }
    
    private func setLabel() {
        userImageView.image = UIImage(named: person.userImage)
        nameLabel.text = person.name
        surnameLabel.text = person.lastname
        professionLabel.text = person.profession
        filmsLabel.text = person.film
        roleLabel.text = person.role
    }
}

