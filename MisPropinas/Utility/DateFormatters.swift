//
//  DateFormatters.swift
//  MisPropinas
//
//  Created by Martin Seguel on 28-11-23.
//

import Foundation

struct DateFormatters {
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
