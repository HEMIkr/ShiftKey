//
//  ShiftRow.swift
//  CodingChallenge
//
//  Created by Aleksander Wędrychowski on 11/11/2021.
//

import SwiftUI
import Models

struct ShiftRow: View {
    private enum ViewConstants {
        static let imageWidth: CGFloat = 75
        static let imageHeight: CGFloat = 75
    }

    let shift: Shift

    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: Constants.Margin.standard) {
                buildImage()
                Text("Some sample text")
            }
            .cornerRadius(Constants.viewsCornerRadius)
            .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 1)
        }
    }
    
    @ViewBuilder private func buildImage() -> some View {
        AsyncImage(
            url: URL(string: "https://images.dog.ceo/breeds/terrier-yorkshire/n02094433_1868.jpg"),
            content: { _ in },
            placeholder: { ProgressView() }
        )
            .frame(
                width: ViewConstants.imageWidth,
                height: ViewConstants.imageHeight,
                alignment: .center
            )
    }
}

struct ShiftRow_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ShiftRow(shift: .init(id: "", title: ""))
                .frame(width: 350.0, height: 100.0)
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
