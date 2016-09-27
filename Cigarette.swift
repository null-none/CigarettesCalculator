//
//  Cigarette.swift
//  
//
//  Created by Dmitry on 9/28/16.
//
//

import Foundation


class Cigarette {

    var NowTimestamp = Date().timeIntervalSince1970
    var dateFormatter = DateFormatter()
    var age = 0
    var maxAge = 100
    var nicotine = 20.0

    func wastedMoney(_ price: Double, _ year: String, _ items: Int)->Double{
        dateFormatter.dateFormat = "yyyy"
        let AgoTimestamp = dateFormatter.date(from: year)?.timeIntervalSince1970
        return ((NowTimestamp - AgoTimestamp!) / (60 * 60 * 24)) * Double(items) * price
    }

    func realLife(_ items: Int)->Double {
        nicotine *=  Double(items) * 0.5
        return Double(maxAge) / nicotine
    }

    func totalLifelost(_ items: Int)->Int {
        return maxAge - Int(self.realLife(1))
    }
    
}

let cigarette = Cigarette()
cigarette.age = 30
cigarette.maxAge = 90
cigarette.wastedMoney(4.2, "2015", 1)
cigarette.realLife(1)
cigarette.totalLifelost(1)
