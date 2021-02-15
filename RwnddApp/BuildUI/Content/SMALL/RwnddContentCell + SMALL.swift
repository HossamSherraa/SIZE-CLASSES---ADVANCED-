//
//  RwnddContentCell.swift
//  RwnddApp
//
//  Created by Hossam on 2/20/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class RwnddContentCell : UICollectionViewCell{
    
    let imageView = UIImageView(image: UIImage(named: "X1Z1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 0),
        imageView.topAnchor.constraint(equalTo: self.topAnchor , constant:  0),
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: 0),
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: 0)
        ])
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
               
    }
}
