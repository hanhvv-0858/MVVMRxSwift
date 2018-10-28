//
//  CatViewModel.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/28/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import UIKit

class CatViewModel: NSObject {
    var cat: Cat?
    
    var name: String? {
        return cat?.name
    }
    
    var breed: String? {
        return cat?.breed
    }
    
}
