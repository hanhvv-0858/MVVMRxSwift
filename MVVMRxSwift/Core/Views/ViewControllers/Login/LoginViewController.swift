//
//  LoginViewController.swift
//  MVVMRxSwift
//
//  Created by vu.van.hanh on 10/15/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import UIKit
import Reusable

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.login
}
