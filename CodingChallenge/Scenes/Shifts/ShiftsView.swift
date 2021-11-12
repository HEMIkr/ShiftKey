//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI
import Core
import Combine
import Models

struct ShiftsView: View {
    @ObservedObject var viewModel: ShiftsViewModel
    @State private var cancellables: Set<AnyCancellable> = []
    @State private var birthDate = Date()
    var body: some View {
        VStack {
            buildHeader()
            if viewModel.fetching == true { ProgressView().padding() }
            buildList()
        }
    }

    @ViewBuilder private func buildHeader() -> some View {
        VStack(alignment: .leading, spacing: Constants.Margin.standard) {
            VStack {
                buildDatePicker()
                HStack {
                    TextField(viewModel.searchAddressText ,text: $viewModel.searchAddress, prompt: nil)
                    Button(viewModel.searchText) {
                        viewModel.getShifts()
                    }
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder private func buildDatePicker() -> some View {
        DatePicker(selection: $viewModel.searchStartDate, in: Date()..., displayedComponents: .date) {
            Text(viewModel.searchDateText)
                .font(.body)
                .foregroundColor(Color(uiColor: UIColor.lightGray))
        }
    }
    
    @ViewBuilder private func buildList() -> some View {
        List($viewModel.shifts) {
            Text("shift: \($0.id)")
        }
        .onAppear {
            viewModel.getShifts()
        }
        .navigationTitle(viewModel.titleText)
        .toolbar {
            Button("Force Navigation") {
                viewModel.showDetails(Shift(id: "", title: ""))
            }
        }
        .alert(viewModel.error?.localizedDescription ?? "", isPresented: $viewModel.showError) { }
    }
}
