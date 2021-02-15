//
//  UsersCell.swift
//  RwnddApp
//
//  Created by Hossam on 2/15/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class UsersCell : UICollectionViewCell {
    var rwnddImage : RwnddImage!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        rwnddImage.imageView.image = nil
    }
    func configCell(sizeClass : UIUserInterfaceSizeClass){
        self.contentView.addSubview(rwnddImage)
       
        NSLayoutConstraint.activate([rwnddImage.topAnchor.constraint(equalTo:  self.contentView.topAnchor ) ,
                                     rwnddImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     rwnddImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     rwnddImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
