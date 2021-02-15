//
//  RwnddItem.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class RwnddLabel : UILabel , RwnddItemSupport{
    var supportedInSizeClass: ViewSupport
    let colorStyle : Colors
    let textStyle : TextMode
    var title : String
    var isFirstLoad  = false
    init(supportedInSizeClass : ViewSupport , sizeClass : UIUserInterfaceSizeClass  , appearanceState : ApperanceState , textStyle : TextMode , colorStyle : Colors , title : String) {
        self.colorStyle = colorStyle
        self.textStyle = textStyle
        self.title = title
        self.supportedInSizeClass = supportedInSizeClass
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        configApperanceWith(state: appearanceState)
        configSizeClassWith(sizeClass: sizeClass)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSizeClassWith(sizeClass: UIUserInterfaceSizeClass) {
        if supportedInSizeClass.supportedIn(sizeClass: sizeClass){
            if !isFirstLoad{
                self.isHidden = false}
            self.text = title
            
            self.font = textStyle.forState(sizeClass: sizeClass)
            }
        else {
            if !isFirstLoad{
                self.isHidden = true
            }
        }
        
    }
    
    func configApperanceWith(state: ApperanceState) {
        self.textColor = colorStyle.setupColorFor(apperanceState: state)
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configSizeClassWith(sizeClass: self.traitCollection.horizontalSizeClass)
    }
    
    
}

