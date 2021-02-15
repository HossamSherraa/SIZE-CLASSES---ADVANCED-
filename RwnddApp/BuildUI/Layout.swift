//
//  header.swift
//  RwnddApp
//
//  Created by Hossam on 1/18/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class  RwnddViewBase : RwnddView {
    var headerStyle : HeaderViewState = .full {
        didSet {
            
                self.updateHeight(WithState: self.headerStyle)
            
        }
    }
    
    let scrollView : UIScrollView
    let currentSizeClass : UIUserInterfaceSizeClass
    lazy var heightOfHeader = headerView.bottomAnchor.constraint(equalTo: self.catergoriesItems.bottomAnchor , constant: 0)
    
    init(scrollView : UIScrollView ) {
        self.scrollView  = scrollView
        self.currentSizeClass = scrollView.traitCollection.horizontalSizeClass
        super.init(sizeClass: self.scrollView.traitCollection.horizontalSizeClass, apperanceState: .light, items: [], viewSupport: .init(compact: true , regular: true ), superView: self.scrollView)
        buildConstraits()
        scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.bounces = false
        scrollView.addSubview(self)
       let _  = RwnddContentCollectionView(rwnddViewBase: self)
      
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(sizeClass: UIUserInterfaceSizeClass, apperanceState: ApperanceState, items: [RwnddItemSupport], viewSupport: ViewSupport, superView: UIView) {
        fatalError()
    }
    
    
   
    lazy var  searchIcon = RwnddImage(supportedInSizeClass: .init(compact: true , regular: true), typeOfImage: .navigationIcon, nameOfImage: "search", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration: .init())
    
    lazy var logo = RwnddImage(supportedInSizeClass: .init(compact: true , regular: true ), typeOfImage: .logo
        , nameOfImage: "logo", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration: .init(compact: nil, regular: nil))

    lazy var profileImage = RwnddImage(supportedInSizeClass: .init(compact: true , regular: true ), typeOfImage: .profileImage, nameOfImage: "0", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration: .init(compact: .greenDot, regular: .greenDot))
    
    lazy var apperanceState = RwnddImage(supportedInSizeClass: .init(compact: false , regular: true ), typeOfImage: .navigationIcon, nameOfImage: "apperanceState", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration:  .init())
    
    lazy var notifications = RwnddImage(supportedInSizeClass: .init(compact: false , regular: true ), typeOfImage: .navigationIcon, nameOfImage: "notifications", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration: .init())
    
    
    
    
    
    //leftMenueItems
    
    
    lazy var trendingCat = LeftMenueCategories(labelText: "Trending", imageName: "trending", sizeClass: self.scrollView.traitCollection.horizontalSizeClass)
    
    lazy var gamingCat = LeftMenueCategories(labelText: "Gaming", imageName: "gaming", sizeClass:  self.scrollView.traitCollection.horizontalSizeClass)
    
    lazy var liveCat = LeftMenueCategories(labelText: "Live", imageName: "live", sizeClass: self.scrollView.traitCollection.horizontalSizeClass)
    
    lazy var musicCat = LeftMenueCategories(labelText: "Music", imageName: "music", sizeClass: self.scrollView.traitCollection.horizontalSizeClass)
    
    lazy var onlineLabel = RwnddLabel(supportedInSizeClass: .init(compact: false , regular: true ), sizeClass: self.scrollView.traitCollection.horizontalSizeClass, appearanceState: .light, textStyle: .onlineNow, colorStyle: .darkBlue, title: "Online Now")
    
    lazy var settingsIcon = RwnddImage(supportedInSizeClass: .init(compact: false , regular: true ), typeOfImage: .categoryIcon, nameOfImage: "settings", apperance: .light, sizeClass: self.scrollView.traitCollection.horizontalSizeClass, decoration: .init(compact: .none, regular: .none))
    
    lazy var  headerView = RwnddView(sizeClass: self.scrollView.traitCollection.horizontalSizeClass, apperanceState: .light, items: [searchIcon , logo , profileImage , apperanceState , notifications ], viewSupport: .init(compact: true , regular: true), superView: self.scrollView)
    
    
    lazy var  usersCollectionView = UsersCollectionView(sizeClass: self.scrollView.traitCollection.horizontalSizeClass, numberOfShowedUsers: 5)
    
    lazy var   leftMenue = RwnddView(sizeClass: self.scrollView.traitCollection.horizontalSizeClass, apperanceState: .light, items: [ usersCollectionView, onlineLabel , settingsIcon , profileImage , catergoriesItems], viewSupport: .init(compact: true , regular: true), superView: self.scrollView)
    
    
    
    lazy var  catergoriesItems = RwnddStack(sizeClass: self.scrollView.traitCollection.horizontalSizeClass, supportedIn: .init(compact: true, regular: true ), items: [trendingCat , gamingCat , liveCat , musicCat])
    
     func buildConstraits () {
        //LeftMenue
       
        
        headerView.clipsToBounds = false 
       
      
        
       //Header
        
        let leftMenueWidth = max(self.scrollView.bounds.width * 0.1, self.scrollView.bounds.height * 0.1)
        
        
       
     
        
        
       
        
      
        
       
        leftMenue.backgroundColor = .white
        self.scrollView.backgroundColor = .white
        
        
        
        
        
       
        
        
        headerView.backgroundColor = .white
        let regular =  [
            headerView.leadingAnchor.constraint(equalTo: leftMenue.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 110),
            
            
            leftMenue.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor , constant:0),
            leftMenue.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            leftMenue.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
            leftMenue.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
            leftMenue.heightAnchor.constraint(equalTo: self.scrollView.frameLayoutGuide.heightAnchor).priority(.init(rawValue: 999)),
            leftMenue.widthAnchor.constraint(equalToConstant: leftMenueWidth ),
            
            logo.centerXAnchor.constraint(equalTo: headerView.centerXAnchor , constant: -leftMenueWidth/2),
            logo.centerYAnchor.constraint(equalTo: headerView.centerYAnchor) ,
            
            headerView.trailingAnchor.constraint(equalTo: apperanceState.trailingAnchor , constant: 30),
            apperanceState.centerYAnchor.constraint(equalTo: logo.centerYAnchor) ,
            
            apperanceState.leadingAnchor.constraint(equalTo: notifications.trailingAnchor , constant:  30) ,
            notifications.centerYAnchor.constraint(equalTo: logo.centerYAnchor) ,
            
            searchIcon.leadingAnchor.constraint(equalTo: headerView.leadingAnchor , constant:  20 ) ,
            searchIcon.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            
            leftMenue.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: leftMenue.safeAreaLayoutGuide.topAnchor , constant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            catergoriesItems.centerXAnchor.constraint(equalTo: leftMenue.centerXAnchor),
            catergoriesItems.topAnchor.constraint(equalTo: profileImage.bottomAnchor , constant: 80).priority(.init(rawValue: 5)),
            catergoriesItems.topAnchor.constraint(greaterThanOrEqualTo: profileImage.bottomAnchor , constant: 20),
            catergoriesItems.heightAnchor.constraint(lessThanOrEqualToConstant: 690),
            catergoriesItems.heightAnchor.constraint(equalToConstant: 690).priority(.init(rawValue: 800)),
            catergoriesItems.heightAnchor.constraint(greaterThanOrEqualToConstant: 240),
          
            
            
            onlineLabel.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            onlineLabel.topAnchor.constraint(greaterThanOrEqualTo: catergoriesItems.bottomAnchor , constant: 30),
            onlineLabel.topAnchor.constraint(equalTo: catergoriesItems.bottomAnchor , constant:230).priority(.init(rawValue: 8)),
            onlineLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            
            usersCollectionView.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor , constant: +10) ,
            usersCollectionView.widthAnchor.constraint(equalToConstant: ImageType.profileImage.getSizeFor(sizeClass: .regular) + 20),
            usersCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 330) ,
            usersCollectionView.heightAnchor.constraint(equalToConstant: 330).priority(.defaultHigh),
            
            
            
            usersCollectionView.topAnchor.constraint(equalTo: onlineLabel.bottomAnchor , constant:11 ),
            
            
            
            settingsIcon.topAnchor.constraint(equalTo: usersCollectionView.bottomAnchor , constant: 650).priority(.init(rawValue: 10)),
            settingsIcon.topAnchor.constraint(greaterThanOrEqualTo: usersCollectionView.bottomAnchor, constant: 32),
            settingsIcon.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            
           
            leftMenue.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: settingsIcon.bottomAnchor , constant: 20)
            
            
            
        ]
        
       
        
        
        let compact =  [
            
            headerView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            
            self.heightOfHeader,
            
           
            
            
            
            logo.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor , constant: -25),
            
            searchIcon.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            searchIcon.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            
            headerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            profileImage.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            
            usersCollectionView.topAnchor.constraint(equalTo: logo.bottomAnchor , constant: -20),
            usersCollectionView.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            headerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo:  usersCollectionView.trailingAnchor , constant: 20 ),
            usersCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
           
            
            catergoriesItems.leadingAnchor.constraint(equalTo: leftMenue.leadingAnchor , constant: 0),
            leftMenue.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: catergoriesItems.trailingAnchor , constant: 0),
            catergoriesItems.topAnchor.constraint(equalTo: usersCollectionView.bottomAnchor, constant: -70),
            catergoriesItems.heightAnchor.constraint(equalToConstant: 100)
            
            
            ,
            leftMenue.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            leftMenue.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            leftMenue.topAnchor.constraint(equalTo: usersCollectionView.bottomAnchor),
            leftMenue.heightAnchor.constraint(equalToConstant: 20)
            
            
            
            
            
            
        ]
        
        leftMenue.isHidden = false
        
        
        headerView.regularConstraints = regular
        headerView.compactConstraints = compact
        
      
        
        
       
    }
    
    
    
    func chnageApperanceWith(apperanceState: ApperanceState) {
        
        
        headerView.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0, blue: 0.09411764706, alpha: 1)
        usersCollectionView.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0, blue: 0.09411764706, alpha: 1)
        leftMenue.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0, blue: 0.09411764706, alpha: 1)
        scrollView.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0, blue: 0.09411764706, alpha: 1)
        leftMenue.chnageApperanceWith(apperanceState: apperanceState)
    }
    
    
    func updateHeight(WithState state : HeaderViewState ) {
        switch state {
        case .full:
           self.heightOfHeader.constant += 10
           
           UIView.animate(withDuration: 120, animations: {
             self.layoutIfNeeded()
           })
        case .half:
            
            self.heightOfHeader.constant -= 10
            
                self.headerView.layoutIfNeeded()
        case .reset:
            self.heightOfHeader.constant  = 0
           
            UIView.animate(withDuration:120, animations: {
              self.layoutIfNeeded()
            })
        }
        
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}



extension NSLayoutConstraint {
    func priority(_ p : UILayoutPriority)->NSLayoutConstraint{
        self.priority = p
        return self
    }
}
