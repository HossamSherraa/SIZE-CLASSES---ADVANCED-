//
//  RwnddViewController.swift
//  RwnddApp
//
//  Created by Hossam on 1/12/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class RwnddViewController : UIViewController {
    
    lazy var safeArea = self.view.safeAreaLayoutGuide
    lazy var scrollView = self.view as! UIScrollView
    lazy var  contentGuide = self.scrollView.contentLayoutGuide
    lazy var frameGuide = self.scrollView.frameLayoutGuide
    var currentStatusBarStyle : UIStatusBarStyle = .default
    var firstLoad = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return currentStatusBarStyle
    }
    
    override func loadView() {
        self.view = {
            let view = UIScrollView(frame: UIScreen.main.bounds)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
        

    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
  
      
        
       
        
      
        
            
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if firstLoad {
            buildMainView()
            firstLoad = false 
        }
        
        var btn : UIButton {
            let btn = UIButton.init(frame: .init(x: 100, y: 90, width: 170, height: 40))
            btn.setTitle("NOT PRESSED", for: .normal)
            btn.addTarget(self, action: #selector(done), for: .touchUpInside)
            btn.backgroundColor = .blue
           
            return btn
        }
      
       
        
       
    }
    
   
    @objc func done (){
       
        if let ww = self.view.window as? RwnddWindow{
            ww.changeCurrentStateWithState(state: .dark)
           



        }
   }
    
    
   
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       if  self.traitCollection.userInterfaceIdiom == .pad{
            return .all
       }else{
        return .all
        }
    }
   
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
                    let vx = self.view.subviews.compactMap{
             if let r = $0 as? RwnddContentCollectionView {
               
                DispatchQueue.main.async { [weak r] in
                    r?.flow.invalidateLayout()
                }
             }
         }

    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
    
}

extension RwnddViewController : ChangeApperanceDelegate {
    func apperanceDidChangeWithState(_: ApperanceState) {
        let vv = self.view.subviews.compactMap({ $0 as? RwnddView})
        vv.forEach{$0.chnageApperanceWith(apperanceState: .dark)}
       
        let xx = self.view.subviews.compactMap({ $0 as? RwnddViewBase})
               xx.forEach{$0.chnageApperanceWith(apperanceState: .dark)}
        
        
        let tt = self.view.subviews.compactMap { $0 as? RwnddContentSupport
            
        }
        tt.forEach{
            var r = $0
            r.chnageApperanceWith(apperanceState: .dark)
            r.currentApperanceState = .dark
            
        }
        
        self.currentStatusBarStyle = .lightContent
        self.setNeedsStatusBarAppearanceUpdate()
    
        
        //Handel  Apperance Changed Here
    }
    
    
}



