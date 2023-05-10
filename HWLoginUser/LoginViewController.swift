//
//  ViewController.swift
//  HWLoginUser
//
//  Created by mac on 09.05.2023.
//
//Создайте приложение с двумя экранами:

//1. На первом экране LoginViewController реализуйте авторизацию пользователя с использованием текстовых полей для ввода имени пользователя и пароля.
//
//2. Настройте соответствующие параметры для клавиатуры: отключите автокоррекцию и предиктивный ввод, вводимые символы в поле для пароля должны скрываться. Обеспечьте условия, при которых клавиатура не перекрывает элементы интерфейса на экране.
//
//3. Реализуйте скрытие клавиатуры при тапе по экрану, переопределив метод touchesBegan:
//
// Метод для скрытия клавиатуры тапом по экрану
//override func touchesBegan(_ touches: Set, with event: UIEvent?) {
//    super .touchesBegan(touches, with: event)
//}
//4. Валидируйте данные пользовательского ввода, используя метод shouldPerformSegue(withIdentifier:sender:). Этот метод вызывается перед выполнением перехода, и если он возвращает false, переход не состоится:
//
//override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//    guard userNameTextField.text == user, passwordTextField.text == password else {
//        // Введенное имя не валидно, отменяем переход и показываем алерт контроллер
//        return false
//    }
//
//    // Введенное имя валидно, разрешаем переход
//    return true
//}
//5. В случае успешной авторизации перейдите на второй экран WelcomeViewController, где отобразите приветствие с именем пользователя и кнопку "логаута" для возврата на первый экран.
//
//6. Передайте имя пользователя между экранами, используя метод prepare.
//
//7. При возврате на первый экран очистите текстовые поля для ввода имени пользователя и пароля, используя метод unwind.
//
//8. Для вызова или скрытия клавиатуры в симуляторе используйте сочетание клавиш Command + K.
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
        guard userNameTextField.text == "user"  else {
            // Введенное имя не валидно, отменяем переход и показываем алерт контроллер
            showAlert(withTitle: "Username is not correct!", andMessage: "Try again!")
            return false
        }
        
        guard passwordTextField.text == "password" else {
            showAlert(withTitle: "Password is not correct!", andMessage: "Try again!")
            return false
        }
        // Введенное имя валидно, разрешаем переход
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
