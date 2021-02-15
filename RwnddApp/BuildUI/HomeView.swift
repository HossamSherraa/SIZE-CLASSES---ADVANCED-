//
//  HomeView.swift
//  RwnddApp
//
//  Created by Hossam on 1/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

extension RwnddViewController {
    func buildMainView(){
       switch self.scrollView.traitCollection.horizontalSizeClass {
       case .compact: print("COmpac")
       case .regular : print("Reg")
       default:
           break
       }
        let rwnddViewBase = RwnddViewBase(scrollView: self.scrollView )
        
        
        
 
        
        
    }
}
