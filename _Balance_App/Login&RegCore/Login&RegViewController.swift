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
    

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var currentState: State = .login
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSegmentChange(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            currentState = .login
        } else if segmentedControl.selectedSegmentIndex == 1 {
            currentState = .register
        }
        
       
        
        switch currentState {
        case .login:
           return// actionButton.setTitle("Register", for: .normal)
        case .register:
           return// actionButton.setTitle("Login", for: .normal)
        }
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
