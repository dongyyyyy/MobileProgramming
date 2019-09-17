//
//  ViewController.swift
//  Dictionary
//
//  Created by Hallym on 16/09/2019.
//  Copyright © 2019 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Dic = [1:["A","B"]]
    var Dic2 : [Int : [String]] = [:]

    @IBOutlet var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Dic[2] = ["C","D"]
        for (DicKey, DicValue) in Dic{
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+DicValue[1])
        }
        
        Dic2[1] = ["CC","DD"]
        Dic2[2] = ["KK","ZZ"]
        Dic2[3] = ["HHH","AAA"]
        Dic2.updateValue(["DDDD","ZZZZZ"],forKey: 2)
        for (DicKey, DicValue) in Dic2{
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+", "+DicValue[1])
        }
        
    }


}

