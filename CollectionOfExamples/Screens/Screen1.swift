//
//  Screen1.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 12/30/22.
//

import SwiftUI

struct Screen1: View {
  @AppStorage("screen1") var isScreen1: Bool = true
  @State private var buttonWidth: Double = 800
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = true
  @State private var imageOffset: CGSize = .zero
  @State private var indicatorOpacity: Double = 1.0
  
    var body: some View {
      ZStack {
        Color(.blue)
        VStack(spacing: 20) {
          Spacer()
          VStack(spacing: 0) {
            Text("Say something")
            Text("It's not how much we give but how much love we put into giving.")
          }
          ZStack {
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
              .offset(x: imageOffset.width * -1)
            Image(systemName: "zr.rectangle.roundedtop")
              .resizable()
              .scaledToFit()
              .opacity(isAnimating ? 1 : 0)
          }
          .overlay(
            Image(systemName: "arrow.left.and.right.circle")
            , alignment: .bottom
          )
          Spacer()
          Button(action: {
            isScreen1 = false
          }) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            Text("Start")
          }

        } //: VSTACK
      } //: ZSTACK
      .onAppear(perform: {
        isAnimating = true
      })
      .preferredColorScheme(.dark)
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
    }
}
