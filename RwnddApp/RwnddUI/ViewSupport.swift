//
//  ViewSupport.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
import UIKit
struct ViewSupport {
     let compact : Bool
     let regular : Bool
    
    func supportedIn(sizeClass : UIUserInterfaceSizeClass)->Bool{
        switch sizeClass {
        case .compact: return compact
        case .regular: return regular
        default : return false
        }
    }
}
