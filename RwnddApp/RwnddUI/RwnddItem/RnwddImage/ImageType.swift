//
//  ImageType.swift
//  RwnddApp
//
//  Created by Hossam on 1/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
enum ImageType : String {
    case categoryIcon = "icon"
    case navigationIcon = "navigationIcon"
    case cellMainIcon = "cellMainIcon"
    case cellIcon = "cellIcon"
    case profileImage = "profile"
    case logo = "logo"
    
    struct RwnddSize {
        let compact : CGFloat
        let regular : CGFloat
    }
    var getSize : RwnddSize {
        switch self {
        
        case .categoryIcon:
            return .init(compact: 40, regular: 25)
        case .navigationIcon:
            return .init(compact: 32, regular: 29)
        case .cellMainIcon:
            return .init(compact: 21, regular: 21)
        case .cellIcon:
            return .init(compact: 140, regular: 140)
        case .profileImage:
            return .init(compact: 50, regular: 50)
        case .logo:
            return .init(compact: 100, regular: 104)
        
        }
    }
    
    func getSizeFor(sizeClass : UIUserInterfaceSizeClass)->CGFloat{
        let size = self.getSize
        switch sizeClass {
        case .compact: return size.compact
        case .regular : return size.regular
        default : return 0
        }
    }
    
}
