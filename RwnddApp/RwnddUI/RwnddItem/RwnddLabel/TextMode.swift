//
//  TextMode.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
import UIKit
enum TextMode {
    case title , menue , onlineNow , cellUserName , cellTitle , cellTime , seeMore 
    
    struct FontSize {
        let compact : CGFloat
        let regular : CGFloat
        let weight : UIFont.Weight
    }
    
     private func getFont()->FontSize {
               switch self {
                
               case .title: return .init(compact: 21, regular: 28, weight: .bold)
                
               case .menue: return .init(compact: 16, regular: 17, weight: .bold)
                
               case .onlineNow: return .init(compact: 16, regular: 16, weight: .semibold)
                
               case .cellUserName: return .init(compact: 11, regular: 11, weight: .heavy)
                
               case .cellTitle: return .init(compact: 23, regular: 28, weight: .semibold)
                
               case .cellTime: return .init(compact: 11, regular: 11, weight: .heavy)
                
               case .seeMore: return .init(compact: 13, regular: 13, weight: .medium)
                
              
                
            
        
        }
           }
    
    func forState(sizeClass : UIUserInterfaceSizeClass)->UIFont{
        let fontSize = self.getFont()
        switch sizeClass {
        case .compact : return UIFont.systemFont(ofSize: fontSize.compact, weight: fontSize.weight)
        case .regular : return UIFont.systemFont(ofSize: fontSize.regular, weight: fontSize.weight)
        default :  return UIFont.systemFont(ofSize: fontSize.regular, weight: fontSize.weight)
        }
    }
    
}



//
//  TextMode.swift
//  RwnddApp
//
//  Created by Hossam on 2/18/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import Foundation
