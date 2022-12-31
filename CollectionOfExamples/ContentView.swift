//
//  ContentView.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        List {
          NavigationLink("RunBashCmd", destination: RunBashCmd())
          NavigationLink("RunNodeCmd", destination: RunNodeCmd())
          NavigationLink("RunWebServer", destination: RunWebServer())
          NavigationLink("FileOpen", destination: FileOpen())
          NavigationLink("FileDrop", destination: FileDrop())
          NavigationLink("LoadLocalImage", destination: LoadLocalImage())
//          NavigationLink("LoadImage", destination: LoadImage())
          NavigationLink("WebBrowse", destination: WebBrowse())
          NavigationLink("ReadingView", destination: ReadingView(text: ""))
          NavigationLink("Text2Diagram", destination: Text2Diagram(txt: .constant("IloveU")))
          NavigationLink("DispAsyncImage", destination: DispAsyncImage(imageURL: "https://credo.academy/credo-academy@3x.png"))
        }
      }
      .navigationTitle("MySwiftExamples")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
