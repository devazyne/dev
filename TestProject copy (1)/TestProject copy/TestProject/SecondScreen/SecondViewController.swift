//
//  SecondViewController.swift
//  TestProject
//
//  Created by Rami on 10/29/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var renegadeTableView: UITableView!
    
    let viewModel: SecondScreenViewModelProtocol
    
    init(viewModel: SecondScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
        navigationController?.navigationBar.isTranslucent = false
        title = "Home Screen"
        
        // Configure Table View
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.renegadeTableView.reloadData()
        }
    }
    
    func setupUI() {
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.white, for: .normal)
    }
    
    func setupTableView() {
        renegadeTableView.delegate = self
        renegadeTableView.dataSource = self
        renegadeTableView.register(UINib(nibName: "RenegadeCell", bundle: nil), forCellReuseIdentifier: "RenegadeCell")
        renegadeTableView.separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    @IBAction func filterPressed(_ sender: Any) {
        let filterViewController = FilterViewController()
        let nav = UINavigationController(rootViewController: filterViewController)
        // 1
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        navigationController?.pushViewController(filterViewController, animated: true)
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.returnFilteredUsers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = renegadeTableView.dequeueReusableCell(withIdentifier: "RenegadeCell", for: indexPath) as! RenegadeCell
        
        let user = viewModel.returnFilteredUsers()[indexPath.row]
        
        // Configure my UI
        cell.configureUI(image: user.image , title: user.firstName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = viewModel.users?[indexPath.row] else { return }
        let viewModel = viewModel.resolveDetailViewModel(user: user)
        navigationController?.present(DetailViewController(viewModel: viewModel), animated: true)
    }
}
