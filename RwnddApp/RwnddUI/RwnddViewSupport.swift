//
//  RwnddViewSupport.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

protocol RwnddViewSupport : UIView  {
    
    
    func changeSizeClassWith(sizeClass : UIUserInterfaceSizeClass)
    func chnageApperanceWith(apperanceState : ApperanceState)
    }

extension RwnddViewSupport where Self : RwnddView {
    
    
    func changeSizeClassWith(sizeClass : UIUserInterfaceSizeClass){
  
        if self.supportedIn.supportedIn(sizeClass: sizeClass){
            self.isHidden = false
            
          
                   
                   subviews.forEach{
                       if let rwnddItem = $0 as? RwnddItemSupport {
                           rwnddItem.configSizeClassWith(sizeClass: sizeClass)
                       }
                   }
            
             setupConstraintsFor(sizeClass: sizeClass)
            
        }else {
           
            self.isHidden = true
        }
        
    }
    
    
    func chnageApperanceWith(apperanceState : ApperanceState){
        
        self.subviews.forEach{
            if let rwnddItem = $0 as? RwnddItemSupport {
                rwnddItem.configApperanceWith(state: apperanceState)
               
            }
            
        }
        
        
        
    }
}
