//
//  HomeView.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 12/30/22.
//

import SwiftUI

struct Screen2: View {
  @AppStorage("screen") var nScreen: Int = 1
  @State private var isAnimating: Bool = false
    var body: some View {
      VStack(spacing: 20) {
        Spacer()
        ZStack {
          CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
          Image(systemName: "figure.walk")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: isAnimating ? 35 : -35)
            .animation(
              Animation
                .easeInOut(duration: 4)
                .repeatForever()
              , value: isAnimating
            )
        }
        Text("The time that leads to mastery is dependent on the intensity of our focus.")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()
        Spacer()
        Button(action: {
          withAnimation {
//            playSound(sound: "success", type: "m4a")
            nScreen = 1
//            isAnimating.toggle()
          }
        }) {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)
          Text("Restart")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
//        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      }
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
          isAnimating = true
        })
      })
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
    }
}
