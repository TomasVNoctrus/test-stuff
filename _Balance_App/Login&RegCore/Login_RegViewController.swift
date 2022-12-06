//
//  Login&RegViewController.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-11-29.
//

import UIKit

class Login_RegViewController: UIViewController {
    
    enum State {
        case login
        case register
    }

    @IBOutlet weak var loginRegisterSegment: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var oKButton: UIButton!
    
    var currentState: State = .login
    let userManager: UserManager = UserManager()
    var userForSegue: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSegmentChange(_ sender: Any) {
        //pagal pasirinkta segmenta keicia state kintamojo busena
        if loginRegisterSegment.selectedSegmentIndex == 0 {
            currentState = .login
        } else if loginRegisterSegment.selectedSegmentIndex == 1 {
            currentState = .register
        }
        //pagal pasirinkta segmenta parodo arba paslepia slaptazodzio kartojimo langa
        repeatPasswordTextField.isHidden = currentState != .register
        //pagal pasirinkta segmenta keicia mygtuko uzrasa
        switch currentState {
        case .login:
           return oKButton.setTitle("Register", for: .normal) //kas tas "for: .normal" ?
        case .register:
           return oKButton.setTitle("Login", for: .normal)
        }
    }
    
    
    @IBAction func onActionButtonClick(_ sender: Any) {
        switch currentState {
            // if currentState == .register
        case .register:
            let result = userManager.register(
                username: usernameTextField.text!,
                password: passwordTextfield.text!,
                confirmPassword: repeatPasswordTextField.text!)
            validateUser(from: result)  // kas as validate ??
            // else if currentState == .login
        case .login:
            let result = userManager.login(username: usernameTextField.text!, password: passwordTextfield.text!)
            validateUser(from: result)   // kas as validate ??
        }
    }
    
    private func validateUser(from userResult: UserResult) {
        if let errorTitle = userResult.errorTitle, let errorMessage = userResult.errorMessage {
            showError(title: errorTitle, message: errorMessage)
        } else {
            if let user = userResult.user {
                userForSegue = user
                performSegue(withIdentifier: "home", sender: nil)
            }
        }
    }

    private func showError(title: String, message: String) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)  // prideda veiksma prie esanciu alertController veiksmu
        self.present(alertController, animated: true)
    }
    
    func getUserRoom() {
        
       // performSegue(withIdentifier: "UserRoom", sender: <#T##Any?#>)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 /*
  //
  //  LoginViewController.swift
  //  CodeAcademyChat
  //
  //  Created by Romas Petkus on 2022-11-07.
  //

  import UIKit

  class LoginViewController: UIViewController {
      enum State {
          case register
          case login
      }
      
      @IBOutlet weak var segmentedControl: UISegmentedControl!
      @IBOutlet weak var usernameTextField: UITextField!
      @IBOutlet weak var passwordTextField: UITextField!
      @IBOutlet weak var confirmPasswordTextField: UITextField!
      @IBOutlet weak var actionButton: UIButton!
      
      var currentState: State = .register
      let userManager: UserManager = UserManager()
      var userForSegue: User!
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
      }

      @IBAction func onSegmentChange(_ sender: Any) {
          if segmentedControl.selectedSegmentIndex == 0 {
              currentState = .register
          } else if segmentedControl.selectedSegmentIndex == 1 {
              currentState = .login
          }
          
          confirmPasswordTextField.isHidden = currentState != .register
          
          switch currentState {
          case .register:
              actionButton.setTitle("Register", for: .normal)
          case .login:
              actionButton.setTitle("Login", for: .normal)
          }
      }
      
      @IBAction func onActionButtonClick(_ sender: Any) {
          switch currentState {
              // if currentState == .register
          case .register:
              let result = userManager.register(
                  username: usernameTextField.text!,
                  password: passwordTextField.text!,
                  confirmPassword: confirmPasswordTextField.text!)
              validateUser(from: result)
              // else if currentState == .login
          case .login:
              let result = userManager.login(username: usernameTextField.text!, password: passwordTextField.text!)
              validateUser(from: result)
          }
      }
      
      private func validateUser(from userResult: UserResult) {
          if let errorTitle = userResult.errorTitle, let errorMessage = userResult.errorMessage {
              showError(title: errorTitle, message: errorMessage)
          } else {
              if let user = userResult.user {
                  userForSegue = user
                  performSegue(withIdentifier: "home", sender: nil)
              }
          }
      }
      
      private func showError(title: String, message: String) {
          let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alertController.addAction(alertAction)
          self.present(alertController, animated: true)
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "home" {
              if let viewController = segue.destination as? HomeViewController {
                  viewController.user = userForSegue
                  userForSegue = nil
              }
          }
      }
  }


  */
