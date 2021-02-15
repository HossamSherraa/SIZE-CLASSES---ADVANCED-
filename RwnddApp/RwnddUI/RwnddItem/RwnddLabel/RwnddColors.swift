//
//  RwnddColors.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


enum Colors {
    case darkBlue
    
    
    func setupColorFor(apperanceState : ApperanceState)->UIColor {
        let color = getColor
        switch apperanceState {
        case .dark : return color.darkApperance
        case .light : return color.lightApperance
        }
    }
    
    internal struct RwnddApperancesColors{
        let darkApperance : UIColor
        let lightApperance : UIColor
    }
    
    //InternalUsage
    var getColor : RwnddApperancesColors  {
        switch self {
        case .darkBlue : return RwnddApperancesColors(darkApperance: .white, lightApperance: .black)
        }
    }
    
    
}

