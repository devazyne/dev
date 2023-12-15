//
//  DetailViewController.swift
//  TestProject
//
//  Created by Rami on 12/5/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        profileImageView.image = UIImage(named: viewModel.user.image)
        firstNameLabel.text = viewModel.user.firstName
        lastNameLabel.text = viewModel.user.lastName
        ageLabel.text = String(viewModel.user.age)
    }
    

}
