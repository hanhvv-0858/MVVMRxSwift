//
//  AppConfig.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/27/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

struct AppConfig {
    static let realmDataVersion     = 1
}

import RealmSwift

struct AppRealmManager {
    
    static func config() {
        let fileURL = Realm.Configuration.defaultConfiguration.fileURL
        logD("\(String(describing: fileURL))")
        
        // get schema version
        let schemaVersion = UInt64(AppConfig.realmDataVersion)
        
        // create config
        let config = Realm.Configuration(
            schemaVersion: schemaVersion,
            migrationBlock: { _, oldSchemaVersion in
                if oldSchemaVersion < schemaVersion {
                }
        })
        
        // set config
        Realm.Configuration.defaultConfiguration = config
    }
}
