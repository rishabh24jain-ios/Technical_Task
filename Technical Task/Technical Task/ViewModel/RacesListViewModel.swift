

// MARK: - ViewModel
import Foundation
import Combine

class RaceListViewModel: ObservableObject {
  @Published var races: [Race] = []
  @Published var selectedCategory: String? = nil

  private var cancellables = Set<AnyCancellable>()
  private let raceService = RaceService()

  init() {
    fetchRaces()
    startTimer()
  }

  func fetchRaces() {
    raceService.fetchRaces(categoryID: selectedCategory?.isEmpty == false ? selectedCategory : nil)
      .sink(receiveCompletion: { completion in
        if case .failure(let error) = completion {
          print("Error fetching races: \(error)")
        }
      }, receiveValue: { [weak self] fetchedRaces in
        self?.races = fetchedRaces.filter { $0.advertisedStart > Date() }
      })
      .store(in: &cancellables)
  }

  func startTimer() {
    Timer.publish(every: 1, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        self?.removeExpiredRaces()
      }
      .store(in: &cancellables)
  }

  private func removeExpiredRaces() {
    races = races.filter { $0.advertisedStart > Date() }
  }
}
