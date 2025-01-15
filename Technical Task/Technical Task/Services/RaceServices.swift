//
//  ContentView.swift
//  Technical Task
//
//  Created by Rishabh Jain on 15/1/2025.
//
import Foundation
import Combine

// MARK: - Race Service
class RaceService {
  func fetchRaces(categoryID: String?) -> AnyPublisher<[Race], Error> {
    var urlString = "https://api.neds.com.au/rest/v1/racing/?method=nextraces&count=10"
    if let categoryID = categoryID, !categoryID.isEmpty {
      urlString += "&category_id=\(categoryID)"
    }
    guard let url = URL(string: urlString) else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: RaceResponse.self, decoder: JSONDecoder())
      .map { $0.data.sortedRaces() }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
