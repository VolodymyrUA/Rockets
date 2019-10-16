//
//  Launches.swift
//  TestProjectTableView
//
//  Created by Volodymyr Smulskyi on 10/9/19.
//  Copyright © 2019 Volodymyr Smulskyi. All rights reserved.
//

import Foundation
import UIKit

struct  Launches: Decodable {
    var launches: [Launch]?
}

struct Launch: Decodable {
    
    var id: Int
    var name: String?
    var net: String?
    var vidURLs: [String]?
    var location: Location?
    var rocket: Rocket?
    var missions: [Mission]?
    var lsp: Lsp?
}

struct Location: Decodable {
    var id: Int
    var name: String?
    var countryCode: String?
    var pads: [Pads]?
}

struct Pads: Decodable {
    var id: Int
    var mapURL: String?
    var latitude: Float?
    var longitude: Float?
    var agencies: [Agencies]?
}

struct Agencies: Decodable {
    var infoURLs: [String]?
}

struct Rocket: Decodable{
    var id: Int
    var name: String?
    var familyname: String?
    var wikiURL: String?
    var imageURL: String?
}

struct Mission: Decodable {
    var id: Int
    var name: String?
    var description: String?
}

struct Lsp: Decodable {
    var id: Int
    var name: String?
    var countryCode: String?
    var wikiURL: String?
}



