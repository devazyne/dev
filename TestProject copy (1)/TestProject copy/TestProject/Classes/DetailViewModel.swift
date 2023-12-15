//
//  DetailViewModel.swift
//  TestProject
//
//  Created by Rami on 12/5/23.
//

import Foundation



protocol DetailViewModelProtocol {
    var user: UserObject { get }
}

// Default implementation of CalculatorService
class DetailViewModel: DetailViewModelProtocol {
    
    var user: UserObject
    
    init(user: UserObject) {
        self.user = user
    }
    
//    func interpretUser(firstName: String?, lastName: String?, age: Int?) {
//        // Guard
//        guard let firstName = firstName else { return }
//        guard let lastName = lastName else { return }
//        guard let age = age else { return }
//
//
//        // if let
//        if let firstName = firstName, let lastName = lastName, let age = age {
//            print("I exist")
//        } else {
//            print("I don't exist")
//        }
//    }
}
