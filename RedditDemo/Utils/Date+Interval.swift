//
//  Date+Interval.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import Foundation

extension Date {
    private enum _Constants {
        static let timeOffsetGMT5: TimeInterval = 60 * 5 * 60
    }
    
    enum Component {
        case seconds
        case minutes
        case hours
    }
    
    func getIntervalBetween(_ date: Date, in component: Date.Component) -> Int {
        let seconds = Int((timeIntervalSince1970 - _Constants.timeOffsetGMT5) - date.timeIntervalSince1970)

        switch component {
        case .seconds:
            return seconds
        case .minutes:
            let hours = seconds / 3600
            let minutes = (seconds - hours * 3600) / 60
            return minutes
        case .hours:
            return seconds / 3600
        }
    }
}
