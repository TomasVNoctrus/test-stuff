//
//  UserRoomViewController.swift
//  _Balance_App
//
//  Created by tomas vnoctrus on 2022-12-05.
//

import UIKit

class UserRoomViewController: UIViewController {
    
    
    @IBOutlet weak var userInfotextView: UILabel!
    var user: User!
    var userbalancei: UserBalance!
    //var userName
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         
        navigationItem.hidesBackButton = true
        userInfotextView.text = "Hello, \(user.username), Your Balance today is:  0.00"  //\(userbalancei.userbalance)

        
    }

    //MARK: - Actions
   
        
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
