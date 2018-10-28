//
//  ListCatViewController.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/27/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import UIKit

class ListCatViewController: UIViewController {
    @IBOutlet weak var tbCatList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        self.tbCatList.backgroundColor = .red
        // Do any additional setup after loading the view.
        
    }

}

// MARK: - StoryboardSceneBased
extension ListCatViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.cat
}
