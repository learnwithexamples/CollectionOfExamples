//
//  RunBashCmd.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/26/22.
//

import SwiftUI
import WebKit


struct RunWebServer: View {
  @State var script = "/Users/learnwithexamples/github/CollectionOfExamples/test.js"
  @State var isRunning = false
  @State var data = "Check"

  var body: some View {
      VStack {
        Text("Checker Tool")
          .font(.largeTitle)
          .padding()
        HStack {
          WebView(url: URL(string: "http://localhost:8082/"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("RunWebServer")
          Button(data) {
            let process = Process()
            let pipe = Pipe()
            process.standardOutput = pipe
//            process.launchPath = "/usr/bin/osascript"
            process.launchPath = "/usr/local/bin/node"
            process.arguments = ["\(script)"]
            process.launch()
//            isRunning = true
//            process.waitUntilExit()
            data = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
//            sleep(10)
//            isRunning = false
        }
        .disabled(isRunning)
        .padding(.trailing)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .navigationTitle("RunWebServerCmd")
  }
}

struct RunWebServer_Previews: PreviewProvider {
    static var previews: some View {
        RunWebServer()
    }
}
