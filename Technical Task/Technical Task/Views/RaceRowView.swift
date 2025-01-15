//
//  RaceRowView.swift
//  Technical Task
//
//  Created by Rishabh Jain on 15/1/2025.
//
import SwiftUI

struct RaceRowView: View {
  let race: Race

  @State var timeRemaining: String = ""
  @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  var body: some View {
    VStack(alignment: .leading) {
      Text("\(race.meetingName) - \(AppConstant.race) \(race.number)")
        .font(.headline)
      Text("\(AppConstant.startsIn) \(timeRemaining)")
        .font(.subheadline)
        .foregroundColor(.gray)
        .onReceive(timer) { _ in
          updateCountdown()
        }
    }
    .onAppear {
      updateCountdown()
    }
  }

   func updateCountdown() {
    let timeLeft = Int(race.advertisedStart.timeIntervalSinceNow)
     timeRemaining = timeLeft > 0 ? "\(timeLeft / 60)m \(timeLeft % 60)s" : AppConstant.started
  }
}
