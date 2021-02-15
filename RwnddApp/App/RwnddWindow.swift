//
//  RwnddWindow.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class RwnddWindow : UIWindow {

    init(rootViewController : RwnddViewController) {
        super.init(frame: UIScreen.main.bounds)
        self.rootViewController = rootViewController
        self.delegate = rootViewController
    }
    
    @available(iOS 13.0, *)
    init(windowScene : UIWindowScene , rootViewController : RwnddViewController) {
        super.init(windowScene: windowScene)
        self.rootViewController  = rootViewController
       self.delegate = rootViewController
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    weak var delegate : ChangeApperanceDelegate?
    func changeCurrentStateWithState(state:ApperanceState){
        self.delegate?.apperanceDidChangeWithState(state)
    }
    
    
    
}
