import SwiftUI

// MARK: - SwiftUI Views
struct RaceListView: View {
  @StateObject private var viewModel = RaceListViewModel()

  var body: some View {
    NavigationView {
      VStack {
        HStack {
          Text(AppConstant.filter)
          Spacer()

          Picker("Category", selection: $viewModel.selectedCategory) {
            Text(RaceCategory.all.rawValue).tag(nil as String?)
            Text(RaceCategory.harnessRacing.rawValue).tag(RaceCategory.harnessRacing.categoryId)
            Text(RaceCategory.horseRacing.rawValue).tag(RaceCategory.horseRacing.categoryId)
            Text(RaceCategory.greyhoundRacing.rawValue).tag(RaceCategory.greyhoundRacing.categoryId)
          }
          .pickerStyle(.menu)
          .onChange(of: viewModel.selectedCategory) {
            viewModel.fetchRaces()
          }
        }
        .padding(.leading)
        .padding(.trailing)
        List(viewModel.races) { race in
          RaceRowView(race: race)
        }
        .navigationTitle(AppConstant.upComingRaces)
        .onAppear {
          viewModel.fetchRaces()
        }
      }
    }
  }
}

#Preview {
  RaceListView()
}
