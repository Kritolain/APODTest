//
//  Utils.swift
//  APODTest
//
//  Created by Carolain Lenes Beltran on 22/06/20.
//  Copyright © 2020 Laborintos. All rights reserved.
//

import Foundation
import MBProgressHUD

open class Utils {
    
    // Show Load Indicator
    static func showLoading(_ view: UIView) {
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.bezelView.color = UIColor(named: "blue")
        hud.bezelView.backgroundColor = UIColor(named: "white")
    }
    
    static func hiddenLoading(_ view: UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    
    static func getPastDates(_ days: Int) -> NSMutableArray {

        let dates = NSMutableArray()
        let calendar = Calendar.current

        var today = calendar.startOfDay(for: Date())

        for _ in 1 ... days {

            let day = calendar.component(.day, from: today)
            let month = calendar.component(.month, from: today)
            let year = calendar.component(.year, from: today)

            /*let date = NSMutableDictionary()

            date.setValue(day, forKey: "day")
            date.setValue(month, forKey: "month")
            date.setValue(year, forKey: "year")*/
            
            let dateString = "\(year)-\(month)-\(day)"

            dates.add(dateString)
            today = calendar.date(byAdding: .day, value: -1, to: today)!
        }

        return dates

    }
    
    // Screen height.
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
}
