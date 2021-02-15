//
//  RwnddView.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class RwnddView : UIView , RwnddViewSupport {
   
    
    var isAddedBefore = false
    var sizeClass: UIUserInterfaceSizeClass
    var supportedIn : ViewSupport
    let superView : UIView
    
    required init(sizeClass: UIUserInterfaceSizeClass, apperanceState: ApperanceState , items : [RwnddItemSupport] , viewSupport : ViewSupport , superView : UIView ) {
        self.superView = superView
        self.sizeClass = sizeClass
        self.supportedIn = viewSupport
        super.init(frame: .zero)
        self.setupItems(items: items)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.superView.addSubview(self)
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var compactConstraints : [NSLayoutConstraint] = .init() {
        didSet{
            self.changeSizeClassWith(sizeClass: sizeClass)
        }
    }
    var regularConstraints : [NSLayoutConstraint] = .init(){
        didSet{
            self.changeSizeClassWith(sizeClass: sizeClass)
        }
    }
    
    
    
    func setupConstraintsFor(sizeClass: UIUserInterfaceSizeClass) {
        
        switch sizeClass {
        case .compact: self.regularConstraints.forEach{$0.isActive = false } ; self.compactConstraints.forEach{$0.isActive = true }
            
        case .regular : self.compactConstraints.forEach({$0.isActive = false }) ; self.regularConstraints.forEach{$0.isActive = true }
        default : break
        }
    }
    
    func setupItems(items : [RwnddItemSupport]) {
        items.forEach{
            self.addSubview($0)
            }
        
    }
    
   

    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.changeSizeClassWith(sizeClass: self.traitCollection.horizontalSizeClass)
    }
    
    
    
    
}


