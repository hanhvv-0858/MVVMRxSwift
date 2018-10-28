//
//  CatTableViewCell.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/27/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var editCatAction: (() -> Void)?
    var deleteCatAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindViewModel(_ viewModel: CatViewModel?) {
        if let viewModel = viewModel {
            catNameLabel.text = viewModel.name
            breedLabel.text = viewModel.breed
        } else {
            catNameLabel.text = nil
            breedLabel.text = nil
        }
    }
    
    @IBAction func edit(_ sender: Any) {
        editCatAction?()
    }
    
    @IBAction func deleteProduct(_ sender: Any) {
        deleteCatAction?()
    }
}
