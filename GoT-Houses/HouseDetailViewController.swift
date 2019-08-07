//
//  HouseDetailViewController.swift
//  GoT-Houses
//
//  Created by Timothy Yang on 4/8/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    
    var houseInfo: HouseInfo!

    @IBOutlet weak var houseName: UILabel!
    
    @IBOutlet weak var houseWords: UILabel!
    
    @IBOutlet weak var houseRegion: UILabel!
    
    @IBOutlet weak var houseCoat: UIImageView!
    
    @IBOutlet weak var houseCoatDesc: UILabel!
    
    @IBOutlet weak var houseCoatStatic: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInterface()
        
        
        
     
    }
    func updateInterface() {
        var temp = houseInfo.name
        temp.removeFirst()
        temp.removeFirst()
        houseName.text = temp
        if houseInfo.words != "" {
            
            houseWords.text = "\"" + houseInfo.words + "\""
        } else {
            houseWords.text = ""
        }
        
        houseRegion.text = houseInfo.region
        houseCoat.image = UIImage(named: houseInfo.region)
        if houseInfo.coatOfArms == "" {
            houseCoatDesc.isHidden = true
            houseCoatStatic.isHidden = true
        } else {
            houseCoatDesc.text = houseInfo.coatOfArms
        }
    }

}
