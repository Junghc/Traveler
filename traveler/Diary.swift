//
//  Diary.swift
//  traveler
//
//  Created by User02 on 2019/1/7.
//  Copyright © 2019 User02. All rights reserved.
//

import Foundation
struct Diary: Codable {
    var time: String
    var location: String
    var evaluationIndex: Int
    var text: String
    
    static func read() -> [Diary]? {
        if let data = UserDefaults.standard.data(forKey: "diarys"), let diarys = try? PropertyListDecoder().decode([Diary].self, from: data) {
            return diarys
        } else {
            return nil
        }
    }
    
    static func save(diarys: [Diary]) {
        if let data = try? PropertyListEncoder().encode(diarys) {
            UserDefaults.standard.set(data, forKey: "diarys")
        }
    }
}
