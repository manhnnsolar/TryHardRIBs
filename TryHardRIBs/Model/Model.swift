//
//  Model.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 01/09/2021.
//

import UIKit

class Model {
    init(id: String = UUID().uuidString, namePlayer: String, point: Int) {
        self.id = id
        self.namePlayer = namePlayer
        self.point = point
    }
    
    var id: String
    var namePlayer: String
    var point: Int
}
