//
//  LoginViewModel.swift
//  TestProject
//
//  Created by Rami Moubayed on 19/11/2023.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(username: String?, password: String?) -> Bool
    func resolveSecondViewModel() -> SecondScreenViewModelProtocol
}

// Default implementation of CalculatorService
class LoginViewModel: LoginViewModelProtocol {
    
    // with guard let
    func login(username: String?, password: String?) -> Bool {
        guard let username = username else { return false }
        guard let password = password else { return false }
        
        if username == "" && password == "" {
            return true
        }
        return false
    }
    
    func resolveSecondViewModel() -> SecondScreenViewModelProtocol {
        let viewModel = SecondScreenViewModel()
        return viewModel
    }
}
