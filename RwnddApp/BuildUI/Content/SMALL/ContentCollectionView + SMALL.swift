//
//  ContentCollectionView.swift
//  RwnddApp
//
//  Created by Hossam on 2/21/20.
//  Copyright © 2020 Hossam. All rights reserved.
//


import UIKit
class ContentCollectionView : UICollectionView , UICollectionViewDataSource {
    
    
    var contentFakeData : MainCellData!
    
    let flow = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: .init())
        self.translatesAutoresizingMaskIntoConstraints = false
       
        self.backgroundColor = .white
        self.register(RwnddContentCell.self, forCellWithReuseIdentifier: "ContentCell")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.collectionViewLayout = flow
        self.dataSource = self
        }
    
    func configFlowLayoutFor(_ sizeClass : UIUserInterfaceSizeClass){
        switch sizeClass {
        case .compact:
            flow.scrollDirection = .vertical
            if self.bounds.height > 900 {
                flow.itemSize = .init(width: self.bounds.width, height: self.bounds.height / 2 )
            }else {
                flow.itemSize = .init(width: self.bounds.width, height: self.bounds.height * 0.8)
            }
            flow.minimumLineSpacing = 40
        case .regular:
            flow.scrollDirection = .horizontal
            let lineSpacing : CGFloat = 55
            switch contentFakeData.cellsStyle {
            case .tall:
                flow.itemSize = .init(width: 262 , height: self.bounds.height)
                flow.minimumLineSpacing = lineSpacing
            case .wide:
                flow.itemSize = .init(width: 612, height: self.bounds.height)
                flow.minimumLineSpacing = lineSpacing
            }
             default: break
        }
        
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       
            self.configFlowLayoutFor(self.traitCollection.horizontalSizeClass)
        
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
         
                   self.configFlowLayoutFor(self.traitCollection.horizontalSizeClass)
               
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.contentFakeData!.contentCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! RwnddContentCell
        
        return cell
    }
    
    
}
