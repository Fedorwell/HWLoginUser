//
//  ViewController.swift
//  HWLoginUser
//
//  Created by mac on 09.05.2023.
//


import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "user"
    private let password = "password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = user
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard userNameTextField.text == user,
              passwordTextField.text == password else {
            showAlert(
                title: "Username or password is not correct!",
                andMessage: "Please, enter correct login and password!",
                textField: passwordTextField
            )
            return false
        }
        
        return true
    }
    
    
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
       ? showAlert(title: "Oops!", andMessage: "User name is \(user) 🙄")

        :showAlert(title: "Oops!", andMessage: "Password is \(password) 🤡")
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    
    private func showAlert(title: String, andMessage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: andMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


