//
//  RwnddContentMainCell.swift
//  RwnddApp
//
//  Created by Hossam on 2/20/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
protocol RwnddCellDelegate : class {
     func chnageApperanceWith(apperanceState: ApperanceState)
}


class RwnddContentMainCell : UICollectionViewCell  , RwnddCellDelegate  {
    var indexPath : IndexPath!
    var currentApperance : ApperanceState = .light
   
    
    func chnageApperanceWith(apperanceState: ApperanceState) {
        self.currentApperance = apperanceState
        self.backgroundColor = apperanceState.getRwnddViewColorState()
        self.title.configApperanceWith(state: apperanceState)
        self.seeMore.configApperanceWith(state: apperanceState)
        self.contentCollectionView.backgroundColor = apperanceState.getRwnddViewColorState()
        
    }
    
    
    lazy var contentCollectionViewWidthConstraints = self.contentCollectionView.widthAnchor.constraint(equalToConstant: 0)
    
    var contentCollectionView : ContentCollectionView = .init()
    
    
    var titleString : String!
    {didSet{DispatchQueue.main.async {self.title.text = self.titleString}}}

    lazy var seeMore = RwnddImage(supportedInSizeClass: .init(compact: false , regular: true ), typeOfImage: .cellIcon, nameOfImage: "seeMore", apperance: .light, sizeClass: self.traitCollection.horizontalSizeClass , decoration: .init())
    
    lazy var title : RwnddLabel = .init(supportedInSizeClass: .init(compact: true  , regular: true ), sizeClass: self.traitCollection.horizontalSizeClass, appearanceState: .light, textStyle: .cellTitle, colorStyle: .darkBlue, title: "")
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.chnageApperanceWith(apperanceState: self.currentApperance)
        self.contentCollectionView.contentOffset = .zero
    }

    override init(frame: CGRect) {
       super.init(frame: frame)
        
       self.contentView.addSubview(contentCollectionView)
       self.contentView.addSubview(seeMore)
       self.contentView.addSubview(title)
        
       NSLayoutConstraint.activate([
            self.contentCollectionViewWidthConstraints,
        contentCollectionView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        contentCollectionView.topAnchor.constraint(equalTo: title.bottomAnchor , constant : 15),
        contentCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor) ,
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant:  0),
        title.leadingAnchor.constraint(equalTo: self.contentCollectionView.leadingAnchor , constant: 0),
        contentView.trailingAnchor.constraint(equalTo: seeMore.trailingAnchor , constant:  30),
        title.centerYAnchor.constraint(equalTo: seeMore.centerYAnchor)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.title.text = titleString
        configWidth(sizeClass: self.traitCollection.horizontalSizeClass)
        
        
    }
    
    func configWidth(sizeClass : UIUserInterfaceSizeClass){
        switch sizeClass {
        case .compact:
            self.contentCollectionViewWidthConstraints.constant = self.bounds.width * 0.8
        case .regular:
            self.contentCollectionViewWidthConstraints.constant = self.bounds.width
        default:
            break
        }
        
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configWidth(sizeClass: self.traitCollection.horizontalSizeClass)
        }
}



    

