//
//  ViewController.swift
//  DatePicker
//
//  Created by Hallym on 05/09/2019.
//  Copyright © 2019 Hallym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var btnAlarmStop: UIButton!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var isRed : Bool!
    //각 라벨의 기능을 사용하기 위한 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    
    var alarm : String!
    //프로그램이 실행되면 자동적으로 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval : interval, target : self, selector : timeSelector, userInfo: nil, repeats : true)
        isRed = false
        btnAlarmStop.isEnabled = false
    }
    
    //DatePicker의 액션함수
    @IBAction func chageDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        /*yyyy : 네자리로 연도를 표시 MM : 두 자리로 월을 표시
         dd : 01 ~ 31까지 일을 표시 HH : 01~24까지 24시간 시각을 표시
         mm : 00~59까지 분을 표시 ss : 00~59까지 초를 표시
         EEE : Sun ~ Sat까지 3글자 요일 표시
        */
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarm = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() // @objc가 들어간 이유는 Selector을 사용하기 위한 함수는 Object-C타입의 함수여야 하기 때문에 다음과 같은 함수로 선언한다
    {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        if( (formatter.string(from: date as Date) == alarm) && isRed == false)
        {
            view.backgroundColor = UIColor.red
            isRed = true
            btnAlarmStop.isEnabled = true
            NSLog("Same Date : "+formatter.string(from: date as Date) + " / " + alarm)
            
        }
        if(isRed == true && count < 60)
        {
            NSLog(String(count))
            count = count + 1
            if(count == 60)
            {
                AlarmStopfunc()
            }
        }
    }
    @IBAction func AlarmStop(_ sender: UIButton) {
        if(isRed == true)
        {
            AlarmStopfunc()
        }
    }
    
    func AlarmStopfunc()
    {
        isRed = false
        count = 0
        view.backgroundColor = UIColor.white
        btnAlarmStop.isEnabled = false
        alarm = nil
    }
    

}

