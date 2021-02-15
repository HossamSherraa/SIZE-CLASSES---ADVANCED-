//
//  RwnddItemSupport.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
protocol RwnddItemSupport : UIView{
    func configSizeClassWith(sizeClass : UIUserInterfaceSizeClass)
    func configApperanceWith(state : ApperanceState)
    var supportedInSizeClass : ViewSupport {get}
    
}

