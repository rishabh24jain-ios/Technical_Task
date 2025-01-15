//
//  RaceCategory.swift
//  Technical Task
//
//  Created by Rishabh Jain on 16/1/2025.
//

enum RaceCategory: String, CaseIterable {

  case all = "All"
  case horseRacing = "Horse Racing"
  case harnessRacing = "Harness Racing"
  case greyhoundRacing = "Greyhound Racing"

  var categoryId: String? {
    switch self {
    case .all: return nil
    case .horseRacing: return "4a2788f8-e825-4d36-9894-efd4baf1cfae"
    case .harnessRacing: return "161d9be2-e909-4326-8c2c-35ed71fb460b"
    case .greyhoundRacing: return "9daef0d7-bf3c-4f50-921d-8e818c60fe61"
    }
  }
}
