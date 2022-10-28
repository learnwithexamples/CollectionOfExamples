//
//  FileDrop.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/27/22.
//

import SwiftUI

struct FileDrop: View {
  @State var message: String = "Drag file below, or enter path here"
    var body: some View {
      ScrollView {
        TextField("Path:", text: $message)
          .padding(.all)
        Image(systemName: "plus")
          .padding(100)
          .background(.white)
          .onDrop(of: [.fileURL, .item], isTargeted: nil, perform: {
            providers, _ in
            _ = providers.first!.loadObject(ofClass: NSPasteboard.PasteboardType.self) {
              pasteboarItem, _ in
              message = URL(string: pasteboarItem!.rawValue)!.absoluteString
            }
            return true
          })
        Button("Sign in") {
          signIn()
        }
        Spacer()
      }
      .navigationTitle("FileDrop")
    }
}
func signIn() {
  print("Value is 435324")
}

struct FileDrop_Previews: PreviewProvider {
    static var previews: some View {
        FileDrop()
    }
}
