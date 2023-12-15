//
//  RenegadeCell.swift
//  TestProject
//
//  Created by Rami on 11/30/23.
//

import UIKit

class RenegadeCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureUI(image: String, title: String) {
        imgView.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    
}
