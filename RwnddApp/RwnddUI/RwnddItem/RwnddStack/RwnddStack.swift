//
//  RwnddStack.swift
//  RwnddApp
//
//  Created by Hossam on 2/10/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class RwnddStack : UIStackView , RwnddItemSupport {
    var pointsOfItems : [Int:CGPoint] = [:]
    
    var supportedInSizeClass: ViewSupport
    var items : [RwnddItemSupport]
    let sizeClass : UIUserInterfaceSizeClass
    var isFrameFirstLoad = true
    
    lazy var indecator : UIView  = {
        let view = UIView()
        view.backgroundColor = .blue
        view.frame.size = .init(width: 10, height: 10)
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var itemsOfLeftMenueCategories =  self.items.compactMap{ $0 as? LeftMenueCategories}
    init(sizeClass : UIUserInterfaceSizeClass , supportedIn : ViewSupport , items : [RwnddItemSupport]) {
        self.supportedInSizeClass  = supportedIn
        self.items = items
        self.sizeClass = sizeClass
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.clipsToBounds = false
        items.forEach{
            self.addArrangedSubview($0)
        }
        configSizeClassWith(sizeClass: sizeClass)
        configApperanceWith(state: .light)
       
        (0..<itemsOfLeftMenueCategories.count).forEach{
            itemsOfLeftMenueCategories[$0].index = $0
        }
        self.addSubview(indecator)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.superview?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        getFrameOfLabel()
        print(self.pointsOfItems)
        self.indecator.frame.origin = self.pointsOfItems[0]!
        }
    
    func getFrameOfLabel(){
        self.itemsOfLeftMenueCategories.forEach{
            switch self.traitCollection.horizontalSizeClass {
            case .compact :
                let point = CGPoint(x: $0.center.x   - CGFloat(2 * $0.index!)  , y: $0.center.y + $0.frame.height * 0.48  )
                self.pointsOfItems.updateValue(point, forKey: $0.index)
            case .regular :
                let point = CGPoint(x: $0.center.x + $0.frame.width*0.3 , y: $0.center.y + 10  )
                self.pointsOfItems.updateValue(point, forKey: $0.index)
            default : break
            }
        }
    }
    
    func configSizeClassWith(sizeClass: UIUserInterfaceSizeClass) {
        
        if self.supportedInSizeClass.supportedIn(sizeClass: sizeClass){
           
            
            self.alignment = .fill
            self.distribution = .fillEqually
                          
                          switch sizeClass {
                            
                          case .compact :
                              self.axis  = .horizontal
                              self.spacing = 10
                             
                          case .regular :
                              self.axis = .vertical
                              
                             
                          case .unspecified : break
                  
                   
                          @unknown default:
                            break
            }
            
             self.isHidden = false
        }
            
        else {
            
         self.isHidden = true
            
        }
       }
       
    func configApperanceWith(state: ApperanceState) {
        self.items.forEach{$0.configApperanceWith(state: state)}
       }
    
    func moveTo(_ index : Int?){
        guard let index = index else {return}
        UIView.animate(withDuration: 0.14) {
            self.indecator.frame.origin = self.pointsOfItems[index] ?? .zero
        }
    }
       
}



