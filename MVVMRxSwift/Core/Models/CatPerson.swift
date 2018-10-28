//
//  CatPerson.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/27/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CatPerson: Object, Decodable {
    @objc dynamic var personId: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    var cats = List<Cat>()

    override static func primaryKey() -> String? {
        return "personId"
    }
    
    private enum CatPersonCodingKeys: String, CodingKey {
        case personId
        case firstName
        case lastName
        case cats
    }
    
    convenience init(personId: Int, firstName: String, lastName: String, cats: List<Cat>) {
        self.init()
        self.personId = personId
        self.firstName = firstName
        self.lastName = lastName
        self.cats = cats
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CatPersonCodingKeys.self)
        let personId = try container.decode(Int.self, forKey: .personId)
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        let catsArray = try container.decode([Cat].self, forKey: .cats)
        let catsList = List<Cat>()
        catsList.append(objectsIn: catsArray)
        self.init(personId: personId, firstName: firstName, lastName: lastName, cats: catsList)
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
