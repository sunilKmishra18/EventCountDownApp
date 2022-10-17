//
//  Date+Extensions.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 29/09/22.
//

import Foundation

extension Date {
    func timeRemainingComponent(until endDate: Date) -> String? {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter.string(from: self, to: endDate)
    }
}
