//
//  ContentCellStyle.swift
//  RwnddApp
//
//  Created by Hossam on 2/21/20.
//  Copyright © 2020 Hossam. All rights reserved.
//



struct ContentCellData {
    enum CellType {
        case news , live , video
    }
    
    let userName : String
    let profileImage : Int
    let time : String
    let cellType : CellType
    
    
}

//BIG
struct MainCellData {
    enum CellsStyle {
        case wide , tall
    }
    let title : String
    let cellsStyle : CellsStyle
    let contentCellData : [ContentCellData]
}
