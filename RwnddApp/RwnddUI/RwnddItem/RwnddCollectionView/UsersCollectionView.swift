//
//  usersCollectionView.swift
//  RwnddApp
//
//  Created by Hossam on 2/15/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class UsersCollectionView : UICollectionView , UICollectionViewDataSource , RwnddItemSupport {
    func configSizeClassWith(sizeClass: UIUserInterfaceSizeClass) {
        configLayout(sizeClass: sizeClass)
       
    }
    
    func configApperanceWith(state: ApperanceState) {
        
    }
    
    var supportedInSizeClass: ViewSupport = .init(compact: true , regular: true)
    
   
    
    let sizeClass : UIUserInterfaceSizeClass
    let numberOfShowedUsers : Int
    
    
    init(sizeClass : UIUserInterfaceSizeClass  , numberOfShowedUsers : Int) {
        self.sizeClass = sizeClass
        self.numberOfShowedUsers = numberOfShowedUsers
        super.init(frame: .init(), collectionViewLayout: UICollectionViewFlowLayout.init())
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints  = false
        
        self.register(UsersCell.self, forCellWithReuseIdentifier: "UsersCell")
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = false
        
        self.collectionViewLayout = UsersCollectionViewLayout(sizeClass: sizeClass)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func fakeUsersCreator()->[RwnddImage]{
       
        return (0...numberOfShowedUsers).map{
            return RwnddImage(supportedInSizeClass: .init(compact: true , regular: true ), typeOfImage: .profileImage, nameOfImage: "\($0)", apperance: .light, sizeClass: self.sizeClass, decoration: .init(compact: .stroke, regular: .greenDot))
        }
    }
    
  
    
   
    func configLayout(sizeClass : UIUserInterfaceSizeClass){
        
        if let layout = self.collectionViewLayout as? UsersCollectionViewLayout {
            layout.sizeClass = sizeClass
        }
        
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return numberOfShowedUsers
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCell", for: indexPath) as! UsersCell
        if indexPath.row == numberOfShowedUsers-1 {
            
            cell.rwnddImage = RwnddImage(supportedInSizeClass: .init(compact: true , regular: true ), typeOfImage: .profileImage, nameOfImage: "X", apperance: .light, sizeClass: self.sizeClass, decoration: .init(compact: .none, regular: .none))
            cell.configCell(sizeClass: self.sizeClass)
            return cell
        }
        cell.rwnddImage = fakeUsersCreator()[indexPath.row]
        cell.configCell(sizeClass: self.sizeClass)
        return cell
       }
    
    
   
}
