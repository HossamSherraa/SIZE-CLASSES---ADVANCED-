//
//  ApperanceDecoration.swift
//  RwnddApp
//
//  Created by Hossam on 1/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
import UIKit
enum Decoration : String {
    case stroke = "stroke"
    case greenDot = "greenDot"
}
struct ApperanceDecoration{
    
    var compact : Decoration?
    var regular : Decoration?
    
    func isEnabledFor(sizeClass : UIUserInterfaceSizeClass)->Decoration?{
        switch  sizeClass {
        case .compact:
            return compact ?? nil
        case .regular :
            return regular ?? nil
        case .unspecified:
            return nil
        }
    }
}

struct IsDecorationLoaded {
    var greenDot : Bool = false 
    var stroke : Bool = false
}


//switch Decoration {
//}
