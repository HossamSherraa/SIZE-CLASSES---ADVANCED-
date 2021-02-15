//
//  RwnddContentSupport.swift
//  RwnddApp
//
//  Created by Hossam on 2/28/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

protocol RwnddContentSupport {
     func chnageApperanceWith(apperanceState: ApperanceState)
    var currentApperanceState : ApperanceState {get set}
}
