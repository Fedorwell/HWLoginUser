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
    
    @IBOutlet var getLoginButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка клавиатуры для поля ввода имени пользователя
        userNameTextField.textContentType = .username
        userNameTextField.autocorrectionType = .no
        userNameTextField.spellCheckingType = .no
        
        // Настройка клавиатуры для поля ввода пароля
        passwordTextField.textContentType = .password
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        passwordTextField.isSecureTextEntry = true
        
        getLoginButtonTapped.layer.cornerRadius = 10
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let username = "user"
        let password = "password"
        guard userNameTextField.text == username  else {
        
            showAlert(withTitle: "Username is not correct!", andMessage: "Try again!")
            return false
        }
        
        guard passwordTextField.text == password else {
            showAlert(withTitle: "Password is not correct!", andMessage: "Try again!")
            return false
        }
       
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? WelcomeViewController else { return }
        settingsVC.hellowUserValue = userNameTextField.text
    }
    
    @IBAction func forgotUNButton() {
        showAlert(withTitle: "User name is:", andMessage: "user")
    }
    
    @IBAction func forgotPassButton() {
        showAlert(withTitle: "Password is:", andMessage: "password")
    }
    
    @IBAction func loginTappedButton() {
        
    }
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard let svc = segue.source as? WelcomeViewController else { return }
        self.userNameTextField.text = svc.clearField
        self.passwordTextField.text = svc.clearField
    }
    
}
extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



