//
//  Text2Diagram.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 11/9/22.
//

import SwiftUI

struct Text2Diagram: View {
  @Binding var txt: String
  @State var data = "Check"
  var body: some View {
    Button(data) {
      let process = Process()
      let pipe = Pipe()
      process.standardOutput = pipe
      process.launchPath = "/usr/local/bin/plantuml"
      process.arguments = ["/Users/learnwithexamples/github/CollectionOfExamples/resources/bob.pu"]
      process.launch()
      process.waitUntilExit()
      data = String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
    }
  }
}

struct Text2Diagram_Previews: PreviewProvider {
    static var previews: some View {
      Text2Diagram(txt: .constant("""
        sdfsdf
      """))
    }
}
