//
//  OxfordDictonary.swift
//  HolidayPlanning
//
//  Created by Saurav Mishra on 20/10/19.
//  Copyright © 2019 Saurav Mishra. All rights reserved.
//

import Foundation
class oxfordDictonary: Codable {
    let results: [LexicalEntries]
}
class LexicalEntries: Codable {
    let lexicalEntries: [Entries]
}
class Entries: Codable {
    let entries: [Senses]
}
class Senses: Codable {
    let senses:[Forsenses]
    
}

class Forsenses: Codable {
    let definitions: [String]?
    let examples: [Text]?
    
}
class Text: Codable {
    let text: String
    
}
