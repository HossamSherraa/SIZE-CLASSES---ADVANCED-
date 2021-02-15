//
//  FlowLayout.swift
//  RwnddApp
//
//  Created by Hossam on 2/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class Flow : UICollectionViewFlowLayout , UICollectionViewDelegateFlowLayout {
    var fakeData : [MainCellData]!
    
    var currentApperance : ApperanceState = .light
    override init() {
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    var attributesCach : [UICollectionViewLayoutAttributes] = .init()
    
    override func prepare() {
        super.prepare()
        self.collectionView?.decelerationRate = .fast
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           let cell = cell as? RwnddContentMainCell
        if cell?.currentApperance != self.currentApperance {
            cell?.currentApperance = self.currentApperance
            cell?.chnageApperanceWith(apperanceState: self.currentApperance)
        }
           
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        guard let rwnddContentCollectionView = collectionView as? RwnddContentCollectionView else {return.zero}
        switch rwnddContentCollectionView.traitCollection.horizontalSizeClass {
        case .compact:
            
            return .init(width: rwnddContentCollectionView.bounds.width, height: rwnddContentCollectionView.bounds.height)
            
        case .regular :

            switch rwnddContentCollectionView.mainCellFakeData[indexPath.row].cellsStyle {
            case .tall: return .init(width: rwnddContentCollectionView.bounds.width, height: 570)
                
            case .wide: return.init(width: rwnddContentCollectionView.bounds.width, height: 410)
            }
        default: break
        }
       
        
        return .zero
    
        
       
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        if self.attributesCach.isEmpty  || self.attributesCach.first != self.layoutAttributesForItem(at: .init(item: 0, section: 0)){
            self.attributesCach = (0..<self.collectionView!.numberOfItems(inSection: 0)).compactMap{
                let indexPath = IndexPath(item: $0, section: 0)
                return  self.layoutAttributesForItem(at: indexPath)
            }
        }
        
        var offset = CGPoint.zero
        switch self.collectionView!.traitCollection.horizontalSizeClass {
        case .compact: offset =  self.attributesCach.sorted {abs($0.frame.origin.x - proposedContentOffset.x) < abs($1.frame.origin.x - proposedContentOffset.x) }.first!.frame.origin
        case .regular : let point  = self.attributesCach.sorted {abs($0.frame.origin.y - proposedContentOffset.y) < abs($1.frame.origin.y - proposedContentOffset.y) }.first!.frame.origin
        offset = .init(x: point.x, y: point.y - self.collectionView!.adjustedContentInset.top)
        default:
            break
        }
        return offset
    }
    
    override var collectionViewContentSize: CGSize{
        let size =  super.collectionViewContentSize
        switch self.collectionView!.traitCollection.horizontalSizeClass {
        case .compact : return size
        case .regular : return CGSize(width: size.width, height: size.height * 1.5)
        default: return size
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = self.collectionView as? RwnddContentCollectionView else {return}
        switch self.collectionView?.traitCollection.horizontalSizeClass {
        case .some(.compact): collectionView.baseView.catergoriesItems.moveTo(collectionView.indexPathForItem(at: .init(x: scrollView.contentOffset.x + 70, y: scrollView.contentOffset.y))?.row)
        case .some(.regular) : collectionView.baseView.catergoriesItems.moveTo(collectionView.indexPathForItem(at: .init(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + 70))?.row)
        default:
            break
        }
    }
    
    
}
