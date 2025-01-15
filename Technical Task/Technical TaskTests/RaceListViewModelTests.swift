//
//  RacesModel.swift
//  Technical TaskTests
//
//  Created by Rishabh Jain on 16/1/2025.
//

import XCTest
@testable import Technical_Task

final class RaceListViewModelTests: XCTestCase {

    func testFetchRaces() {
      let viewModel = RaceListViewModel()
      XCTAssertTrue(viewModel.races.isEmpty)

      let expectation = XCTestExpectation(description: "Fetch races successfully")

      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        XCTAssertFalse(viewModel.races.isEmpty, "Races should not be empty after fetch")
        expectation.fulfill()
      }

      wait(for: [expectation], timeout: 5.0)
    }
  }

  class RaceRowViewTests: XCTestCase {
    func testUpdateCountdown() {
      let futureDate = Date().addingTimeInterval(300)
      let race = Race(id: "1", name: "Test Race", number: 1, meetingName: "Test Meeting", categoryID: "test", advertisedStart: futureDate)
      let view = RaceRowView(race: race)

      view.updateCountdown()
      XCTAssertTrue(view.timeRemaining.contains("m"), "Countdown should be in minutes format")
    }
  }
