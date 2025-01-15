//
//  RaceModel.swift
//  Technical Task
//
//  Created by Rishabh Jain on 15/1/2025.
//

import Foundation
import Combine
import SwiftUI

// MARK: - Race Model
struct Race: Identifiable, Decodable {
  let id: String
  let name: String
  let number: Int
  let meetingName: String
  let categoryID: String
  let advertisedStart: Date

  enum CodingKeys: String, CodingKey {
    case id = "race_id"
    case name = "race_name"
    case number = "race_number"
    case meetingName = "meeting_name"
    case categoryID = "category_id"
    case advertisedStartContainer = "advertised_start"
  }

  init(id: String, name: String, number: Int, meetingName: String, categoryID: String, advertisedStart: Date) {
    self.id = id
    self.name = name
    self.number = number
    self.meetingName = meetingName
    self.categoryID = categoryID
    self.advertisedStart = advertisedStart
  }

  enum AdvertisedStartKeys: String, CodingKey {
    case seconds
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    number = try container.decode(Int.self, forKey: .number)
    meetingName = try container.decode(String.self, forKey: .meetingName)
    categoryID = try container.decode(String.self, forKey: .categoryID)

    let startContainer = try container.nestedContainer(keyedBy: AdvertisedStartKeys.self, forKey: .advertisedStartContainer)
    let startSeconds = try startContainer.decode(TimeInterval.self, forKey: .seconds)
    advertisedStart = Date(timeIntervalSince1970: startSeconds)
  }
}
