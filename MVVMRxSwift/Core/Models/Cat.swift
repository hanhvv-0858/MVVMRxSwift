//
//  Cat.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/27/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Cat: Object, Decodable {
    @objc dynamic var catId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var breed: String = ""
    @objc dynamic var weight: Double = 0
    
    override static func primaryKey() -> String? {
        return "catId"
    }
    
    private enum CatCodingKeys: String, CodingKey {
        case catId
        case name
        case breed
        case weight
    }
    
    convenience init(catId: Int, name: String, breed: String, weight: Double) {
        self.init()
        self.catId = catId
        self.name = name
        self.breed = breed
        self.weight = weight
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CatCodingKeys.self)
        let catId = try container.decode(Int.self, forKey: .catId)
        let name = try container.decode(String.self, forKey: .name)
        let breed = try container.decode(String.self, forKey: .breed)
        let weight = try container.decode(Double.self, forKey: .weight)
        self.init(catId: catId, name: name, breed: breed, weight: weight)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
