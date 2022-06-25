//
//  Petition.swift
//  HWS-Project7
//
//  Created by Ahuja, Abhishek on 4/22/22.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
struct Petitions: Codable {
    var results : [Petition]
}
