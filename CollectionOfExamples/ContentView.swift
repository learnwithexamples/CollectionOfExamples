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
          NavigationLink("FileOpen", destination: FileOpen())
          NavigationLink("FileDrop", destination: FileDrop())
          NavigationLink("WebBrowse", destination: WebBrowse())
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
