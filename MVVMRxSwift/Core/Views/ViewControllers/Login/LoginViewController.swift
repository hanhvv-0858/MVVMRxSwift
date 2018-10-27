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
        basicEncoding()
        basicDecoding()
        
    }
    
    func basicEncoding() {
        //Basic Encoding and Decoding
        let userObj = User()
        userObj.name = "Hanh Vu"
        let url = URL.init(string: "/assets/missing.png")
        userObj.avatar = Avatar(origin: url, cellphone: nil)
        
        //Encode to Json format
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(userObj)
            if let encodedObjectJsonString = String(data: jsonData, encoding: .utf8) {
                print(encodedObjectJsonString)
            }
        } catch {
            
        }
    }
    
    func basicDecoding() {
        let jsonString = """
                        {
                            "id": 1024,
                              "name": "Ngeng Chhengkim",
                              "username": "ngengchhengkim",
                              "email": "chhengkimngeng@gmail.com",
                              "avatar": {
                                "origin": "/assets/missing.png",
                                "cellphone": "/assets/missing.png"
                              },
                              "private_account": true
                        }
                        """
        if let jsonData = jsonString.data(using: .utf8) {
            //And here you get the Car object back
            do {
                let jsonDecoder = JSONDecoder()
                let userObject = try jsonDecoder.decode(User.self, from: jsonData)
                print(userObject.name)
            } catch {
                
            }
        }
    }
}

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.login
}
