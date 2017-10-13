//
//  OnBoardVC.swift
//  TwoMinuteWarning
//
//  Created by Rob on 9/26/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit
import NotificationCenter
import UserNotifications

class OnBoardVC: UIViewController {
    
    var seconds: TimeInterval?
    @IBOutlet weak var currentSchedule: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    let alarmModel = MyAlarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Get the seconds each time the view is about to appear
        seconds = alarmModel.getTimeUntilNextPeriod(schedule: currentSchedule.text!)
//        UNUserNotificationCenter.current().getPendingNotificationRequests { (notification) in
//            for noti in notification {
//
//            }
//        }
    }
    
    @IBAction func continueTouched(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMain", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
    }
    
     func updateTimer () {
        
        if let actualSeconds = seconds {
            
            
            timeLabel.text = "\(actualSeconds) seconds remaining until next period"
            
            seconds! -= 1
            
        }
        
        
    }
    
    
}