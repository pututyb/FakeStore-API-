//
//  TableViewCell.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 29/07/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let lblButton: UILabel = {
        let lblButton = UILabel()
        lblButton.translatesAutoresizingMaskIntoConstraints = false
        lblButton.text = "First Name"
        lblButton.textColor = .red
        lblButton.font = UIFont(name: "Inter-Regular", size: 13)
        
        return lblButton
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        
        contentView.addSubview(lblButton)
        contentView.addSubview(cellImageView)
        
        
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 40),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            
            lblButton.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 16),
            lblButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lblButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
}
