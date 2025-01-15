//
//  RaceResponse.swift
//  Technical Task
//
//  Created by Rishabh Jain on 15/1/2025.
//

import Foundation

// MARK: - API Response Model
struct RaceResponse: Decodable {
  struct RaceData: Decodable {
    let raceSummaries: [String: Race]
    let nextToGoIds: [String]

    enum CodingKeys: String, CodingKey {
      case raceSummaries = "race_summaries"
      case nextToGoIds = "next_to_go_ids"
    }

    func sortedRaces() -> [Race] {
      nextToGoIds.compactMap { raceSummaries[$0] }
        .filter { $0.advertisedStart > Date().addingTimeInterval(-60) }
        .sorted { $0.advertisedStart < $1.advertisedStart }
    }
  }

  let data: RaceData
}


