//
//  Houses.swift
//  GoT-Houses
//
//  Created by Timothy Yang on 4/8/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Houses {
    var houseArray: [HouseInfo] = []
    
    
    
    var pageNumber = 1
    var houseNum = 1
    
    func getHouses(completed: @escaping () -> ()) {
        let apiURL = "https://www.anapioficeandfire.com/api/houses?page=\(pageNumber)&pageSize=50"
        Alamofire.request(apiURL).responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(self.pageNumber)
                let houseCount = json
                if houseCount.count <= 0 {
                    return
                }
                for id in 0...houseCount.count-1{
                    let houseName = "\(self.houseNum). "+json[id]["name"].stringValue
                    self.houseNum += 1
                    let houseRegion = json[id]["region"].stringValue
                    let houseCoat = json[id]["coatOfArms"].stringValue
                    let houseWords = json[id]["words"].stringValue
                    self.houseArray.append(HouseInfo(name: houseName, region: houseRegion, coatOfArms: houseCoat, words: houseWords))
                
                }
                self.pageNumber += 1
                
            case .failure:
                print("error")
            }
            completed()
            
        }
    }
}
