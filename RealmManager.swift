//
//  RealmManager.swift
//  TotalPlantAssessment
//
//  Created by Nathan Mann on 4/14/15.
//  Copyright (c) 2015 Nathan Mann. All rights reserved.
//

import Foundation
import Realm

public struct Realm {
    
    public static func write(realm: RLMRealm, f: (RLMRealm) -> ()) {
        realm.beginWriteTransaction()
        f(realm)
        realm.commitWriteTransaction()
    }

}