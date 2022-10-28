//
//  FileOpen.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/27/22.
//

import SwiftUI

struct FileOpen: View {
  @State public var filename: String = "Filename"
  @State var showFileChooser = false
    var body: some View {
      HStack {
        Text(filename)
        Button("Select file") {
          let panel = NSOpenPanel()
          panel.allowsMultipleSelection = false
          panel.canChooseDirectories = true
          if panel.runModal() == .OK {
            self.filename = panel.url?.lastPathComponent ?? "<none>"
          }
        }
      }
      .navigationTitle("FileOpen")
    }
}

struct FileOpen_Previews: PreviewProvider {
    static var previews: some View {
        FileOpen()
    }
}
