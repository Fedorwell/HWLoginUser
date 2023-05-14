//
//  ViewController.swift
//  HWLoginUser
//
//  Created by mac on 09.05.2023.
//


import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Propertys
    private let user = UserInfo.makeUser()
    
    private var userName: String {
        user.userName
    }
    private var password: String {
        user.password
    }
    
    
    // MARK: - Override Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userTabBarVC = segue.destination as? UITabBarController
        
        guard let userTabBarVC else { return }
        guard let viewControllers = userTabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user.person.name
                welcomeVC.surname = user.person.lastname
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as? UserViewController
                guard let personVC else { return }
                personVC.person = user.person
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func logInPressed() {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(
                title: "Invalid login or password",
                andMessage: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //
    //        guard userNameTextField.text == userName,
    //              passwordTextField.text == password else {
    //            showAlert(
    //                title: "Username or password is not correct!",
    //                andMessage: "Please, enter correct login and password!",
    //                textField: passwordTextField
    //            )
    //            return false
    //        }
    //
    //        return true
    //    }
    
    
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", andMessage: "User name is \(userName) 🙄")
        
        :showAlert(title: "Oops!", andMessage: "Password is \(password) 🤡")
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - IB Alert
    
    private func showAlert(title: String, andMessage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: andMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


