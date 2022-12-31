//
//  DispAsyncImage.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 12/30/22.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 128)
      .opacity(0.5)
  }
}
struct DispAsyncImage: View {
  var imageURL: String
    var body: some View {
      AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring())) { phase in
        switch phase {
        case .success(let image):
          image.imageModifier().transition(.scale)
        case .failure(_):
          Image(systemName: "ant.circle.fill").iconModifier().transition(.scale)
        case .empty:
          Image(systemName: "photo.circle.fill").iconModifier()
        @unknown default:
          ProgressView()
        }
      }
      .padding(40)
    }
}

struct DispAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
      DispAsyncImage(imageURL: "https://credo.academy/credo-academy@3x.png")
    }
}
