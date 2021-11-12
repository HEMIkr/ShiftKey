//
//  ShiftDetailsView.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import SwiftUI
import Models

struct ShiftDetailsView: View { 
    @ObservedObject var viewModel: ShiftDetailsViewModel

    var body: some View {
        NavigationView {
            Text("Shift details")
                .navigationTitle(viewModel.shiftDetailsText)
        }
    }
}

struct ShiftDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetailsView(
            viewModel: ShiftDetailsViewModel(
                shift: Shift(id: "", title: "")
            )
        )
    }
}
