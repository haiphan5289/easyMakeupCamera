//
//  NSNumberExtension.swift
//  Beberia
//
//  Created by haiphan on 20/01/2022.
//  Copyright © 2022 IMAC. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    var day: Double {
        return 60 * 60 * 24
    }
    
    var week: Double {
        return 60 * 60 * 24 * 7
    }
    
    func toWeek() -> String {
        var text: String = ""
        let week = Int(self / self.week)
        text += "\(week) Tuần "
        let modo = self.truncatingRemainder(dividingBy: self.week)
        let day = Int(modo / self.day)
        if day > 0 {
            text += "\(day) Ngày"
        }
        return text
    }
    
}
