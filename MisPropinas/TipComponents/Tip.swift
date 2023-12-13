//
//  Tip.swift
//  MisPropinas
//
//  Created by Martin Seguel on 27-11-23.
//

import Foundation

struct Tip: Identifiable, Equatable, Codable {
    var id = UUID()
    var amount: Double
    var isCash: Bool
    var date: Date
}
