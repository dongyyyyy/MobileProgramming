//
//  ViewController.swift
//  ImageView
//
//  Created by Hallym on 02/09/2019.
//  Copyright © 2019 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var BtnSize: UIButton!
    @IBOutlet weak var Switcher: UISwitch!
    @IBOutlet weak var BtnUse: UIButton!
    var canUse: Bool?
    var imgOn: UIImage?
    var imgOff: UIImage?
    var remove: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        canUse = true
        imgOn = UIImage(named: "lamp-on.png")
        imgOff = UIImage(named: "lamp-off.png")
        remove = UIImage(named: "lamp-remove.png")
        ImageView.image = imgOn
    }
    

    @IBAction func BtnController(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        NSLog(digit)
        if(digit == "확대" && canUse == true){
            sender.setTitle("축소", for: UIControl.State.normal)
            newWidth = ImageView.frame.width*scale
            newHeight = ImageView.frame.height*scale
            ImageView.frame.size = CGSize(width: newWidth, height: newHeight)
            
        }
        else if(digit == "축소" && canUse == true)
        {
            sender.setTitle("확대", for: UIControl.State.normal)
            newWidth = ImageView.frame.width/scale
            newHeight = ImageView.frame.height/scale
            ImageView.frame.size = CGSize(width: newWidth, height: newHeight)
        }
        
        
    }
    
    @IBAction func BtnUser(_ sender: UIButton) {
        if (sender.currentTitle! == "사용")
        {
            canUse = false
            sender.setTitle("제거", for: UIControl.State.normal)
            ImageView.image = remove
            
            BtnSize.isEnabled = false
            Switcher.isEnabled = false
            
        }
        else{
            canUse = true
            
            sender.setTitle("사용", for: UIControl.State.normal)
            // 사용 유무 결정
            BtnUse.isEnabled = true
            Switcher.isEnabled = true
            if( Switcher.isOn ){
                ImageView.image = imgOn
            }
            else{
                ImageView.image = imgOff
            }
        }
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if (sender.isOn && BtnUse.currentTitle! == "사용"){
            ImageView.image = imgOn
        }
        else if(sender.isOn == false && BtnUse.currentTitle! == "사용"){
            ImageView.image = imgOff
        }
    }
    
}

