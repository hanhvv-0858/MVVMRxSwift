//
//  User.swift
//  MVVMRxSwift
//
//  Created by vu.van.hanh on 10/15/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

import Foundation

struct Avatar: Codable {
    var origin: URL?
    var cellphone: URL?
}

class User: NSObject, Codable {
    var id: Int?
    var name: String?
    var userName: String?
    var email: String?
    var avatar: Avatar?
    var privateAccount: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case email
        case avatar
        case privateAccount = "private_account"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(userName, forKey: .userName)
        try container.encode(email, forKey: .email)
        try container.encode(avatar, forKey: .avatar)
        try container.encode(privateAccount, forKey: .privateAccount)
    }
    override init() {

    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        userName = try values.decode(String.self, forKey: .userName)
        email = try values.decode(String.self, forKey: .email)
        avatar = try values.decode(Avatar.self, forKey: .avatar)
        privateAccount = try values.decode(Bool.self, forKey: .privateAccount)
    }

}
