//
//  RwnddContentViewController.swift
//  RwnddApp
//
//  Created by Hossam on 2/20/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class RwnddContentCollectionView : UICollectionView , UICollectionViewDataSource  , RwnddContentSupport{
    var lastContentOffset : CGFloat = 1
    var currentApperanceState: ApperanceState  = .light {
        didSet {
            self.flow.currentApperance = self.currentApperanceState
        }
    }
    weak var cellDelegate : RwnddCellDelegate?
   
    
    func chnageApperanceWith(apperanceState: ApperanceState) {
            self.backgroundColor = apperanceState.getRwnddViewColorState()
            let w  : [RwnddCellDelegate] =  self.subviews.compactMap{return $0 as? RwnddCellDelegate }
            w.forEach{$0.chnageApperanceWith(apperanceState: apperanceState)}
            }
    
    let mainCellFakeData = FakeData.fakeDataGenerator()
    let baseView : RwnddViewBase
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! RwnddContentMainCell
        cell.titleString = mainCellFakeData[indexPath.row].title
        cell.indexPath = indexPath
        cell.contentCollectionView.contentFakeData = mainCellFakeData[indexPath.row]
        cell.contentCollectionView.delegate = self
       
        return cell
    }
    
     let flow  : Flow  = Flow()

    init(rwnddViewBase : RwnddViewBase) {
        self.baseView = rwnddViewBase
        super.init(frame: .zero, collectionViewLayout: .init())
        config(rnwddViewBase: rwnddViewBase )
        configFlowLayoutWith(rwnddViewBase.superView.traitCollection.horizontalSizeClass)
        self.baseView.catergoriesItems.items.forEach({
            guard let leftMenueItem = $0 as? LeftMenueCategories else {return}
            leftMenueItem.delegate = self
        })
      }
    

    func config(rnwddViewBase : RwnddViewBase){
        
        self.register(RwnddContentMainCell.self, forCellWithReuseIdentifier: "MainCell")
        baseView.scrollView.addSubview(self)
        flow.fakeData = self.mainCellFakeData
         self.collectionViewLayout = flow
        self.delegate = flow
        self.dataSource = self
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: baseView.headerView.leadingAnchor ) ,
            self.topAnchor.constraint(equalTo: baseView.headerView.bottomAnchor , constant: 30) ,
            self.trailingAnchor.constraint(equalTo: baseView.scrollView.frameLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: baseView.scrollView.frameLayoutGuide.bottomAnchor)
           
        ])
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configFlowLayoutWith(_ sizeClass : UIUserInterfaceSizeClass){
        switch sizeClass {
        case .compact:
            self.contentInset.top = 0
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 100
        
       
       
            
        case .regular :
            self.contentInset.top = 10
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 100
            
        default : break
        }
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configFlowLayoutWith(self.traitCollection.horizontalSizeClass)
       
        
              
       
        }

    
   
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configFlowLayoutWith(self.traitCollection.horizontalSizeClass)
        self.baseView.headerStyle = .reset
        
    }
    
   
    
    

    
    }
    
    
extension RwnddContentCollectionView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard self.traitCollection.horizontalSizeClass == .compact else {return}
        
        if self.lastContentOffset < scrollView.contentOffset.y && scrollView.contentOffset.y > 0 {
            
            if self.baseView.heightOfHeader.constant > -128 {
                
                self.baseView.headerStyle = .half
                DispatchQueue.main.async {
                    self.flow.invalidateLayout()
                }
               
            }
            
             self.lastContentOffset = scrollView.contentOffset.y
            
            
            
        }else if (self.lastContentOffset > scrollView.contentOffset.y) {
            if self.baseView.heightOfHeader.constant < 0 {
                self.baseView.headerStyle = .full
                self.flow.invalidateLayout()
            }
             self.lastContentOffset = scrollView.contentOffset.y
            DispatchQueue.main.async {
                self.flow.invalidateLayout()
            }
        }
      
        
        
    }
    
    
 
    
    
    
    
    
}


extension RwnddContentCollectionView : LeftMenueCategoriesDelegate {
    func scrollTo(indexPath: IndexPath) {
        switch self.traitCollection.horizontalSizeClass {
        case .compact: self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true )
        case .regular: self.scrollToItem(at: indexPath, at: .top, animated: true )
        default:
            break
        }
    }
    
    
    
    
}
