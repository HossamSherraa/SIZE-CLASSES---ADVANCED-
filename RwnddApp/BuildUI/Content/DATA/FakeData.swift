//
//  FakeData.swift
//  RwnddApp
//
//  Created by Hossam on 2/21/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

struct FakeData{
    static func fakeDataGenerator()->[MainCellData]{
        let numberOfProfils  =  12
        let names  : [String] = ["Rochelle A. Lott" , "Saed Gamil" , "Hossam Eldin " , "Tamer Hagrass" , "Loca Mordich" , "Mohamed Salah" , "Tamer Ashour" , "Amr Amora" , "John Doe" , "Great Wall" , "Marline Morlo" , "Samira Saied" , "Julia Butrous"]
        let time : [String]  = ["8 Hours Ago" , "2 Minutes Ago" , "Now" ,"10 Hours Ago" , "1 Day Ago", "1 Week Ago"]
        let cellType : [ContentCellData.CellType] = [.news , .live , .video]
        
        let title = ["Trending" , "Gaming" , "Live" , "Music"]
       
        func random(max : Int )->Int{
            return Int.random(in: 0...max)
        }
        let cellData : [ContentCellData] = (0...20).map{_ in
            
            return ContentCellData(userName: names[random(max: names.count-1)], profileImage: random(max: numberOfProfils-1 ), time: time[random(max: time.count - 1 )], cellType: cellType[random(max: cellType.count-1)])
        
        }
        
        let cellStyle : [MainCellData.CellsStyle] = [.wide , .tall]
        return (0...20).map{ _ in
            return MainCellData(title: title[random(max: title.count - 1 )], cellsStyle: cellStyle[random(max: cellStyle.count - 1)], contentCellData: cellData)
        }
       
        
        
    }

}
