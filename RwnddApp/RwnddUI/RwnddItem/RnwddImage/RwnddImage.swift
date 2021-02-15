//
//  RwnddImage.swift
//  RwnddApp
//
//  Created by Hossam on 1/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
//NEEDS TO REFACTOR!@!@!@!@ 19
import UIKit
//Init(SupportIn(true , true ) , typeOfImage : Icon , SupportedInDarkMode : True , nameOfImage ,superView )
class RwnddImage :UIView, RwnddItemSupport {
    var supportedInSizeClass : ViewSupport
    let typeOfImage : ImageType
    let nameOfImage : String
    var isFirstLoad  =  false
    let apperanceDecoration : ApperanceDecoration
    var isDecorationLoaded = IsDecorationLoaded()
    var sizeClass : UIUserInterfaceSizeClass
    
    lazy var imageView :  UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        return imageView
    }()
    
    
    var viewConstraints = [NSLayoutConstraint]()
    
    init(supportedInSizeClass : ViewSupport , typeOfImage : ImageType , nameOfImage : String , apperance : ApperanceState , sizeClass : UIUserInterfaceSizeClass , decoration : ApperanceDecoration) {
        self.supportedInSizeClass = supportedInSizeClass
        self.typeOfImage = typeOfImage
        self.nameOfImage = nameOfImage
        self.apperanceDecoration = decoration
        self.sizeClass = sizeClass
        
        
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.configApperanceWith(state: apperance)
        self.configSizeClassWith(sizeClass: sizeClass)
        self.imageView.contentMode = .scaleAspectFit
        
         if self.typeOfImage == .profileImage {
             imageView.layer.masksToBounds = true
         }
        
        
        
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configSizeClassWith(sizeClass: UIUserInterfaceSizeClass) {
        
        if self.supportedInSizeClass.supportedIn(sizeClass: sizeClass){
            self.isHidden = false
            let size = self.typeOfImage.getSizeFor(sizeClass: sizeClass)
             
            self.layer.cornerRadius =  size / 2
             imageView.layer.cornerRadius = (size) / 2
            
            self.buildDecorationFor(sizeClass: sizeClass)
            buildSizeConstraints(With: self.typeOfImage.getSizeFor(sizeClass: sizeClass))
            }
        else {
            self.isHidden = true
        }
    }
    
    func configApperanceWith(state: ApperanceState) {
        self.imageView.image = createImageWith(apperance: state)
        }
    
    
    func buildSizeConstraints(With size : CGFloat){
        if self.viewConstraints.isEmpty {
            let viewConstraints =  [
                self.heightAnchor.constraint(equalToConstant: size).priority(.defaultHigh),
                self.widthAnchor.constraint(equalToConstant: size  ).priority(.defaultHigh) ,
                self.imageView.heightAnchor.constraint(equalToConstant: size   ) ,
                self.imageView.widthAnchor.constraint(equalToConstant: size  ) ,
                self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
            
            viewConstraints.forEach{$0.isActive = true }
            
            self.viewConstraints = viewConstraints
        }
        else {
            self.viewConstraints.forEach{$0.isActive = false }
            self.viewConstraints.removeAll()
            self.buildSizeConstraints(With: size)
            
        }

        
        
    }
    
    func buildDecorationFor(sizeClass : UIUserInterfaceSizeClass){
        
    let size = self.typeOfImage.getSizeFor(sizeClass: sizeClass)
        
        func buildGreenDot(){
          
            self.layer.sublayers?.forEach{if $0.name == "GreenDot" || $0.name == "Stroke"{
                    $0.removeFromSuperlayer()
                    }}
            let layer = CAShapeLayer()
            layer.name = "GreenDot"
            let path = UIBezierPath(ovalIn: .init(origin: .init(x: size + 2, y: 0), size: .init(width: size * 0.20, height: size * 0.20)))
            layer.path = path.cgPath
            layer.frame = self.bounds
            layer.fillColor = #colorLiteral(red: 0.02132035792, green: 0.9573679566, blue: 0.130958885, alpha: 1)
            self.layer.addSublayer(layer)
               }
        
        func buildStroke(){

            self.layer.sublayers?.forEach{if $0.name == "GreenDot" || $0.name == "Stroke"{
            $0.removeFromSuperlayer()
            }}
            let layer = CAShapeLayer()
            layer.name = "Stroke"
            let path = UIBezierPath.init(ovalIn: .init(origin: .zero, size: .init(width: size  , height: size))).cgPath
            layer.path = path
            if self.typeOfImage == .profileImage && sizeClass == .compact {
                layer.strokeColor = UIColor.blue.cgColor
            }else {
                
            }
            switch sizeClass {
            case .compact:layer.strokeColor = UIColor.blue.cgColor
            case .regular , .unspecified:layer.strokeColor = UIColor.green.cgColor
           
            }
            
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = size*0.08
            layer.frame = .init(x: 0, y: 0, width: size, height: size)
            
            self.layer.addSublayer(layer)
            
        }
           
            
            
            
        
        
        
        if let decoration = self.apperanceDecoration.isEnabledFor(sizeClass: sizeClass){
            switch decoration {
            case .greenDot:  buildGreenDot()
            case .stroke: buildStroke()
            }
        }
        
        
    }
    
    func createImageWith(apperance : ApperanceState)->UIImage{
        func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
           
            return image
        }
        
        let nameString = "\(self.nameOfImage)-\(self.typeOfImage.rawValue)"
        if typeOfImage == .navigationIcon || typeOfImage == .logo || typeOfImage == .categoryIcon || typeOfImage == .cellIcon {
             
            
            switch apperance {
            case .dark:  return UIImage(named: "\(nameString)-D") ?? UIImage()
            case .light:
            
                
                return UIImage(named: "\(nameString)-L") ?? UIImage()
            }
        }
        
        else {
          
            return UIImage(named: "\(nameString)-A") ?? UIImage()
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if self.traitCollection != previousTraitCollection {
            configSizeClassWith(sizeClass: self.traitCollection.horizontalSizeClass)
        }
    }
    
}
