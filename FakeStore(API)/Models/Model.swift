//
//  Model.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 28/07/23.
//

import Foundation

struct Welcome: Codable {
    let id: Int
    let email, username, password: String
    let address: Address
}


struct Address: Codable {
    let city, street: String
    let number: Int
    let zipcode: String
}
