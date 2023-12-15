//
//  ViewController.swift
//  TestProject
//
//  Created by Rami on 10/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    let viewModel: LoginViewModelProtocol

    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = LoginViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        titleLabel.text = "Welcome to Renegade!"
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 24.0)
        loginImageView.image = UIImage(named: "moon")
        
        usernameLabel.text = "Username"
        usernameLabel.font = UIFont(name: "Helvetica-Bold", size: 14.0)
        usernameTextField.placeholder = "Type Username Here"
        
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Helvetica-Bold", size: 14.0)
        passwordTextField.placeholder = "Type Password Here"
        
        loginButton.setTitle("Login".uppercased(), for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14.0)
        
        errorLabel.isHidden = true
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        let canLogin = viewModel.login(username: usernameTextField.text, password: passwordTextField.text)
        if canLogin {
            errorLabel.isHidden = canLogin
            let viewModelInstance = viewModel.resolveSecondViewModel()
            let myViewController = SecondViewController(viewModel: viewModelInstance)
            self.navigationController?.pushViewController(myViewController, animated: true)
        } else {
            errorLabel.isHidden = canLogin
        }
    }
    
}

