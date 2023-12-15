//
//  UserObject.swift
//  TestProject
//
//  Created by Rami on 12/4/23.
//

import Foundation


enum Country: String {
    case france = "France"
    case unitedStates = "United States"
    case canada = "Canada"
    case uk = "United Kingdom"
    case germany = "Germany"
    case australia = "Australia"
    
}

enum numbers: Int {
    case one = 1
    case two = 2
}

class UserObject {
    let firstName: String
    let lastName: String
    let age: Int
    let image: String
    let country: Country
    
    init(firstName: String, lastName: String, age: Int, image: String, country: Country) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.image = image
        self.country = country
    }
}
