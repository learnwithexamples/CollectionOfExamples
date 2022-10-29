//
//  RunBashCmd.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/26/22.
//

import SwiftUI

struct RunNodeCmd: View {
  @State var script = "/Users/learnwithexamples/github/CollectionOfExamples/abc.js"
  @State var isRunning = false
  @State var data = "Check"

  var body: some View {
      VStack {
        Text("Checker Tool")
          .font(.largeTitle)
          .padding()
        HStack {
          Button(data) {
            let process = Process()
            let pipe = Pipe()
            process.standardOutput = pipe
//            process.launchPath = "/usr/bin/osascript"
            process.launchPath = "/usr/local/bin/node"
            process.arguments = ["\(script)"]
            process.launch()
            isRunning = true
            process.waitUntilExit()
            data = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
            sleep(3)
            isRunning = false
        }
        .disabled(isRunning)
        .padding(.trailing)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .navigationTitle("RunNodeCmd")
  }
}

struct RunNodeCmd_Previews: PreviewProvider {
    static var previews: some View {
        RunNodeCmd()
    }
}
