//
//  File.swift
//  traveler
//
//  Created by User02 on 2019/1/7.
//  Copyright © 2019 User02. All rights reserved.
//

import Foundation
struct Travel: Codable {
    var Name: String
    var Tel: String
    var Add: String
    var Toldescribe: String
}

struct TravelResults: Codable {
    var resultCount: Int
    var results: [Travel]
}
