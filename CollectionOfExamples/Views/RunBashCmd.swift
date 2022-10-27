//
//  RunBashCmd.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/26/22.
//
// https://stackoverflow.com/questions/59395221/how-can-i-run-a-shell-script-with-administrator-privileges-within-swiftui-using

import SwiftUI

struct RunBashCmd: View {
  @State var script = "/Users/learnwithexamples/github/CollectionOfExamples/mkFile.sh"
  @State var isRunning = false
  @State var data = "Check"

  var body: some View {
      VStack {
        Text("Checker Tool")
          .font(.largeTitle)
          .padding()
        HStack {
          Button(action: {
            let process = Process()
            let pipe = Pipe()
            process.standardOutput = pipe
            process.launchPath = "/usr/bin/osascript"
//            process.arguments = ["-e", "do shell script \"sh /Users/learnwithexamples/github/CollectionOfExamples/mkFile.sh\" with administrator privileges"]
            process.arguments = ["-e", "do shell script \"sh \(script)\""]
            process.launch()
            isRunning = true
            process.waitUntilExit()
            data = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
            sleep(3)
            isRunning = false
        }) {
            Text(data)
        }
        .disabled(isRunning)
        .padding(.trailing)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct RunBashCmd_Previews: PreviewProvider {
    static var previews: some View {
        RunBashCmd()
    }
}
