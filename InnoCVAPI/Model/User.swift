//
//  Users.swift
//  InnoCVAPI
//
//  Created by Martin Cordoba on 25/9/22.
//

import Foundation

struct User: Identifiable, Codable {
    let name: String?
    let birthdate: String?
    let id: Int?
}
