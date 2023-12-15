//
//  SecondScreenViewModel.swift
//  TestProject
//
//  Created by Rami on 11/13/23.
//

import Foundation


protocol SecondScreenViewModelProtocol {
    var users: [UserObject]? { get }
    func resolveDetailViewModel(user: UserObject) -> DetailViewModelProtocol
    func returnFilteredUsers() -> [UserObject]
}

class SecondScreenViewModel: SecondScreenViewModelProtocol {
    var users: [UserObject]?
    
    init() {
        users = [UserObject]()
        let tim = UserObject(firstName: "Tim", lastName: "Cook", age: 55, image: "Tim", country: .unitedStates)
        let phil = UserObject(firstName: "Phil", lastName: "Schiller", age: 55, image: "Phil", country: .germany)
        let greg = UserObject(firstName: "Greg", lastName: "Joswiak", age: 55, image: "Greg", country: .france)
        let craig = UserObject(firstName: "Craig", lastName: "Federighi", age: 55, image: "Craig", country: .australia)
        users?.append(tim)
        users?.append(phil)
        users?.append(greg)
        users?.append(craig)
    }
    
    func resolveDetailViewModel(user: UserObject) -> DetailViewModelProtocol {
        let viewModel = DetailViewModel(user: user)
        return viewModel
    }

    func returnFilteredUsers() -> [UserObject] {
        var filteredUsers = [UserObject]()
        let selectedFilter = UserDefaults.standard.string(forKey: "currentSelectedCountry")
        
        if let users = users {
            for user in users {
                if user.country.rawValue == selectedFilter {
                    filteredUsers.append(user)
                }
            }
        }
        return filteredUsers
    }
}
