//
//  ViewController.swift
//  CountdownApp
//
//  Created by Shun-Ching, Chou on 2019/4/18.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        
        // 從DatePicker取得結束時間
        let endDate = endDatePicker.date
        
        //顯示結束時間
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = formatter.string(from: endDate)
        endLabel.text = date
        
        // 計算倒數時間
        
        // 結束前一次的timer
        if let timer = timer {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let interval = Int(endDate.timeIntervalSinceNow)
            let sec = interval % 60
            let min = interval/60 % 60
            let hour = interval/60/60 % 24
            let day = interval/60/60/24
            
            self.countdownLabel.text = "\(day)天 \(hour)小時 \(min)分 \(sec)秒"
        }

    }
    

    @IBAction func datePickerChanged(_ sender: Any) {
        updateUI()
    }
    
}

