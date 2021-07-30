//
//  SongTableViewCell.swift
//  Songs
//
//  Created by Gary Milligan on 30/07/2021.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = UIImage(named: "musicIcon")
            iconImageView.tintColor = .red
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    @IBOutlet weak var artistLabel: UILabel! {
        didSet {
            artistLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        }
    }
    
    @IBOutlet weak var bodyView: UIView! {
        didSet {
            bodyView.layer.cornerRadius = 10
                        bodyView.layer.borderWidth = 0.5
                        bodyView.layer.borderColor = UIColor.lightGray.cgColor
                        bodyView.layer.shadowColor = UIColor.black.cgColor
                        bodyView.layer.shadowOpacity = 0.5
                        bodyView.layer.shadowOffset = CGSize(width: 0, height: 1)
                        bodyView.layer.shadowRadius = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .systemGroupedBackground
    }
    
}
