//
//  ChangeApperanceDelegate.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
import UIKit
enum ApperanceState{
    case dark
    case light
    
    func getRwnddViewColorState()->UIColor{
        switch self {
        case .dark : return #colorLiteral(red: 0.02352941176, green: 0, blue: 0.09411764706, alpha: 1)
        case .light : return .white
        }
    }
}
protocol ChangeApperanceDelegate : class {
    func apperanceDidChangeWithState(_:ApperanceState)
}

