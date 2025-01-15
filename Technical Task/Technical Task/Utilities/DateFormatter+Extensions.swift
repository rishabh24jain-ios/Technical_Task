//
//  DateFormatter+Extensions.swift
//  Technical Task
//
//  Created by Rishabh Jain on 15/1/2025.
//

import Foundation

extension DateFormatter {
  static let raceTimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    return formatter
  }()
}
