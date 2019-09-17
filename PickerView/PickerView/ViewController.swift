//
//  ViewController.swift
//  PickerView
//
//  Created by Hallym on 17/09/2019.
//  Copyright © 2019 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var backgroundImageFileName = ["01.png","02.png","03.png","04.png","05.png","06.png","07.png","08.png","09.png","10.png"]
    
    var animalImageFileName = [ "a01.png","a02.png","a03.png","a04.png","a05.png","a06.png","a07.png","a08.png","a09.png","a10.png"]
    var imageArray = [UIImage?]()
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    var whatImage = false
    var currentCheck = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageArray.removeAll()
        NSLog("CurrentRow:"+String(currentCheck))
        if whatImage == false
        {
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: backgroundImageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = backgroundImageFileName[currentCheck]
        imageView.image = imageArray[currentCheck]
        }
        else
        {
            for i in 0..<MAX_ARRAY_NUM{
                let image = UIImage(named: animalImageFileName[i])
                imageArray.append(image)
                
            }
            
            lblImageFileName.text = animalImageFileName[currentCheck]
            imageView.image = imageArray[currentCheck]
        }
        pickerImage.delegate = self
        pickerImage.dataSource = self
        
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        NSLog("333")
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        NSLog("222")
        if whatImage == false{
            return backgroundImageFileName.count
        }
        else{
            return animalImageFileName.count
        }
    }
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String?{ // 드래그를 하고 있을 경우 (선택 이전에 마우스 클릭하여 유지하고 있을 경우
        NSLog("111")
        return backgroundImageFileName[row]
    }
    */
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int)-> CGFloat{
        return PICKER_VIEW_HEIGHT
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing View:UIView?)-> UIView{
        if(whatImage == false)
        {
            NSLog(String(whatImage)+"row:"+String(row))
            currentCheck = row
            let imageView2 = UIImageView(image:imageArray[row])
            imageView2.frame = CGRect(x:0, y: 0, width: 100, height: 150)
            return imageView2
        }
        else{
            NSLog(String(whatImage)+"row:"+String(row))
            let imageView1 = UIImageView(image:imageArray[row])
            imageView1.frame = CGRect(x:0, y: 0, width: 100, height: 150)
            return imageView1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        NSLog("component : "+String(component))
        if whatImage == false
        {
        NSLog("row:"+String(row)+"backgroundImage:"+backgroundImageFileName[row])
        lblImageFileName.text = backgroundImageFileName[row]
        imageView.image = imageArray[row]
        }
        else
        {
            NSLog("row:"+String(row)+"animalImageFileName:"+animalImageFileName[row])
            lblImageFileName.text = animalImageFileName[row]
            imageView.image = imageArray[row]
        }
    }
    @IBAction func BtnChange(_ sender: UIButton) {
        var imageNow = sender.currentTitle
        if(imageNow == "배경")
        {
            whatImage = false
        }
        else
        {
            whatImage = true
        }
        viewDidLoad()
    }
    
}
