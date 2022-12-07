//
//  LoginRegViewController.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-11-29.
//
//importina bendrines vartotojo interakcijos klases, funkcijas
import UIKit

class LoginRegViewController: UIViewController { //tarsi UIViewController expansija ?
    
   enum State { // keletos skirtingu funkciju darbo sinchronizacija
        case login
        case register
   }
    //data input, @IBOutlet weak var - kad apsibrezt gadzeta, kuriam keisim isorinius propercius programos darbo metu
  
    
    @IBOutlet weak var loginRegisterSegment: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var oKButton: UIButton!
    
    // default segmentchange mygtuko eiliskumo kintamasis
    var currentState: State = .login
    //importinam UserManager klase, priskiriam ja vietinei konstantai
    let userManager: UserManager = UserManager()
    //importinam Userio klaseje apsibreztus kintamuosius, po userio logino ar interakcijos siuos kintamuosius uzpildom su duomenimis ir toliau si kintamaji siunciam kartu su perejimu i sekanty langa
    var userForSegue: User!
    
    
    override func viewDidLoad() {    //ka sitas loadina su super visur po defaultu ??
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //vartotojo interakcijos logika su onSegmentChange mygtuku
    @IBAction func onSegmentChange(_ sender: Any) {
        //pagal vartotojo inputo busena keicia onSegmentChange mygtuko kintamojo busena
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
           return oKButton.setTitle("Login", for: .normal) //kas tas "for: .normal" ?
        case .register:
           return oKButton.setTitle("Register", for: .normal)
        }
    }
    
    
     
     
    //paspaudus OK mygtuka, surenka data inputu info ir issiuncia juos i UserManager funkcija ju apdorojimui bei gryzusius duomenis priskiria vietinei konstantai
    @IBAction func onActionButtonClick(_ sender: Any) {
        switch currentState {
        // if currentState == .login
        case .login:
            let result = userManager.login(username: usernameTextField.text!, password: passwordTextField.text!)
            validateUser(from: result)   //iskviecia privacia userio tikrinimo funkcija ir jai suduoda turimus duomenis po mygtuko paspaudimo
            
        // else if currentState == .register
        case .register:
            let result = userManager.register(
                username: usernameTextField.text!,
                password: passwordTextField.text!,
                repeatPassword: repeatPasswordTextField.text!)
            validateUser(from: result)  //iskviecia privacia userio tikrinimo funkcija ir jai suduoda turimus duomenis po mygtuko paspaudimo
           
       
        }
    }
    
  
   
   
 
    //privati funkcija jau konkreciai dealinanti su isorine UserManager funkcija, tiksliau ju rinkiniu;
    
    //privacioji funkcija jau nurodo ka daryti su data input duomenimis pasitelkdama UserManagerio funkciju pagalba
    // susijungia su savo delegatu ?
    private func validateUser(from userResult: UserResult) { //issikviecia UserManagerio funkcija ir ja prisiskiria vietiniam kintamajam
        if let errorTitle = userResult.errorTitle, let errorMessage = userResult.errorMessage {  //errorTitle ir errorMessage kartu apsprendzia ifa ?
            showError(title: errorTitle, message: errorMessage)
        } else {
            if let user = userResult.user {  //ir login(pachekina usery ir siuncia jo data toliau), ir register(priregina ir siuncia jo data toliau) siuncia i userioHomePage
                userForSegue = user //supucia duomenis i issiunciama userio kintamaji
                performSegue(withIdentifier: "userRoom", sender: nil) //atidaro nauja langa
            }
        }
    }
    

    //erroru rodymo funkcija
    private func showError(title: String, message: String) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)  // prideda veiksma prie esanciu alertController veiksmu
        self.present(alertController, animated: true)
    }
    
     /*func goToUserRoom() {
        performSegue(withIdentifier: "UserRoom", sender: <#T##Any?#>)
     }*/
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "userRoom" {
             if let viewController = segue.destination as? UserRoomViewController {
                 viewController.user = userForSegue  //issivalo savo vietiny kintamaji ir perleidzia duomenis sekanciam langui
                 userForSegue = nil
             }
         }
     }
   
  
    
}
