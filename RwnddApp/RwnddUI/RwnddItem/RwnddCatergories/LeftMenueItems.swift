//
//  LeftMenue.swift
//  RwnddApp
//
//  Created by Hossam on 2/10/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
protocol LeftMenueCategoriesDelegate : class {
    func scrollTo(indexPath : IndexPath)
}
class LeftMenueCategories : RwnddImage{
    
    weak var delegate : LeftMenueCategoriesDelegate?
    var index : Int!
    var centerOfLabel : CGFloat!
    
    let label : RwnddLabel
    
    init(labelText : String , imageName : String , sizeClass : UIUserInterfaceSizeClass) {
        self.label = RwnddLabel(supportedInSizeClass: .init(compact: true , regular: true ), sizeClass: sizeClass, appearanceState: .light, textStyle: .menue, colorStyle: .darkBlue, title: labelText)
        super.init(supportedInSizeClass: ViewSupport(compact: true  , regular: true ), typeOfImage: .categoryIcon, nameOfImage: imageName, apperance: .light, sizeClass: sizeClass, decoration: ApperanceDecoration())
        self.addSubview(label)
        
        stup()
        
    }
    
    
    override func configSizeClassWith(sizeClass: UIUserInterfaceSizeClass) {
        super.configSizeClassWith(sizeClass: sizeClass)
        if sizeClass == .compact {
            self.imageView.isHidden = true
        }
        else {
            self.imageView.isHidden = false
        }
    }
    
    
    override func configApperanceWith(state: ApperanceState) {
        self.label.configApperanceWith(state: state)
        super.configApperanceWith(state: state)
    }
    
    func stup(){
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.imageView.bottomAnchor , constant: 7),
            self.imageView.centerXAnchor.constraint(equalTo: self.label.centerXAnchor) ,
            ])
        
        self.isUserInteractionEnabled = true
        self.clipsToBounds = false
        self.label.isUserInteractionEnabled = true
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerOfLabel = self.label.frame.maxX / 2
        print(self.label.frame)
       
    }
   
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.scrollTo(indexPath: IndexPath(item: index, section: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


