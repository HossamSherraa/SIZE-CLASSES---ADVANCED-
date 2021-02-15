//
//  UsersCollectionViewLayout.swift
//  RwnddApp
//
//  Created by Hossam on 2/17/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class UsersCollectionViewLayout : UICollectionViewLayout {
    let imageType : ImageType = .profileImage
    
    var sizeClass : UIUserInterfaceSizeClass {
        didSet {
            self.invalidateLayout()
        }
    }
    var attribtues : [UICollectionViewLayoutAttributes] = []
    var boundsOfItems : CGFloat = 0
    
    override var collectionViewContentSize: CGSize{
        switch sizeClass {
        case .compact:
            return .init(width: boundsOfItems, height: 0)
        case .regular:
            return .init(width: self.collectionView!.bounds.width, height: boundsOfItems)
        default:break
        }
        return .zero
    }
    
    init(sizeClass : UIUserInterfaceSizeClass) {
        self.sizeClass = sizeClass
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepare() {
        super.prepare()
       
        attribtues.removeAll()
        
        guard let collectionView = collectionView else {return}
      
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        
        let sizeOfItem = self.imageType.getSizeFor(sizeClass: sizeClass)
        
        switch sizeClass {
        case .compact:
            let spaceToBeFull = (collectionView.bounds.width - CGFloat( sizeOfItem * CGFloat(numberOfItems) ) ) / CGFloat(numberOfItems)
            var frame = CGRect.init(x: spaceToBeFull/2, y: 10, width: sizeOfItem, height: sizeOfItem)
            for item in 0...numberOfItems-1{
                      let attributes = UICollectionViewLayoutAttributes(forCellWith: .init(item: item, section: 0))
                      attributes.frame = frame
                      
                      frame.origin.x += sizeOfItem + spaceToBeFull
                      self.attribtues.append(attributes)
                      boundsOfItems = frame.maxX
                  
                  }
            
        case .regular:
            let spaceToBeFull = (collectionView.bounds.height - CGFloat( sizeOfItem * CGFloat(numberOfItems)) ) / CGFloat(numberOfItems)
            var frame = CGRect.init(x: 0, y: spaceToBeFull/2, width: sizeOfItem, height: sizeOfItem)
            for item in 0...numberOfItems-1{
                  let attributes = UICollectionViewLayoutAttributes(forCellWith: .init(item: item, section: 0))
                  attributes.frame = frame
                
                  frame.origin.y += sizeOfItem + spaceToBeFull
                  self.attribtues.append(attributes)
                  boundsOfItems = frame.maxY
              
              }
        default:break
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attribtues
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
