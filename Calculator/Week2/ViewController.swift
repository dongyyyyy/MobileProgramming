//
//  ViewController.swift
//  Week2
//
//  Created by Hallym on 29/08/2019.
//  Copyright © 2019 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtCalcul: UITextField!
    @IBOutlet weak var txtVar: UITextField!
    var result : Int!
    var num1 : Int!
    var num2 : Int!
    var op : String!
    var isInputNum : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        isInputNum = true
        num1 = 0
        num2 = 0
        op = ""
        result = 0
        // Do any additional setup after loading the view.
    }
    @IBAction func ButtonUpNum(_ sender: UIButton) {
        var digit = sender.currentTitle! // 누른 버튼의 title 문자
        NSLog("result : " + String(result) + ", num1 : " + String(num1) + ", num2 :" + String(num2) + ", op : " + op)
        
        if(op == "" && result == 0) //
        {
            NSLog("txtVar : " + txtVar.text!)
            //txtVar.text = nil
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtCalcul.text! + digit
            
        }
        else if(op == "" && result != 0)
        {
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtVar.text!
            
        }
        else
        {
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtCalcul.text! + digit            
        }
        
    }
    @IBAction func ButtonUpClear(_ sender: UIButton) {
        txtVar.text = ""
        txtCalcul.text = ""
        num1 = 0
        num2 = 0
        op = ""
        result = 0
    }
    @IBAction func ButtonUpCancel(_ sender: UIButton) {
        
        if txtVar.text != ""
        {
            if(txtVar.text!.count>=2){
                let upperBound1 = String.Index(encodedOffset: txtVar.text!.count-2)
                let text1 = txtVar.text![...upperBound1]
                NSLog(String(text1))
                txtVar.text = String(text1)
            }
            else{
                txtVar.text = nil
            }
            if(txtCalcul.text!.count >= 2 )
            {
                let upperBound2 = String.Index(encodedOffset: txtCalcul.text!.count-2)
                let text2 = txtCalcul.text![...upperBound2]
                txtCalcul.text = String(text2)
            }
            else
            {
                txtCalcul.text = nil
            }
            
        }
        
    }
    @IBAction func ButtonUpOperation(_ sender: UIButton) {
        let digit = sender.currentTitle! // 누른 버튼의 title 문자
        NSLog("op :" + op)
        NSLog("num1 :"+String(num1))
        NSLog("num2 :"+String(num2))
        if digit == "=" {
            num2 = 0
            if(txtVar.text! == "")
            {
                num2 = 0
            }
            else
            {
                num2 = Int(txtVar.text!)

            }
            NSLog("txtVar.text = " + txtVar.text!)
            if(num2 == 0)
            {
                result = num1
                txtVar.text = String(result)
                txtCalcul.text = ""
            }
            else{
                if(op=="+"){
                    result = num1 + num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="-"){
                    result = num1 - num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="*"){
                    result = num1 * num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="/"){
                    result = num1 / num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
            }
            op = ""
            num1 = 0
            num2 = 0
        }
        else{
            if(op == ""){
            op = digit
            num1 = Int(txtVar.text!)
            txtVar.text = ""
            txtCalcul.text = String(num1) + op
            }
            else{
                op = digit
                
                var txtNum = txtCalcul.text!
                let startIndex = txtNum.startIndex
                let endIndex = txtNum.index(before:txtNum.endIndex)
                let range = startIndex..<endIndex
                /*
                let start = txtNum.index(txtNum.startIndex, offsetBy: 1)
                let end = txtNum.index(txtNum.endIndex, offsetBy: -3)
                 
                let range1 = start..<end
                NSLog("aaa:"+String(txtNum[range1]))
                
                 
                */
                num1 = Int(txtNum[range])
                NSLog(String(txtNum))
                NSLog(String(num1))
                txtVar.text = nil
                txtCalcul.text = String(num1) + op
            }
        }
        
    }
    

}

