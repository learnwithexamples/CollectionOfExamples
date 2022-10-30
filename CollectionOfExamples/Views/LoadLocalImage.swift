//
//  LoadLocalImage.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/27/22.
//

import SwiftUI

struct LoadLocalImage: View {
  @State var message: String = "Drag file below, or enter path here"
  @State var image: NSImage = NSImage(systemSymbolName: "plus", accessibilityDescription: nil) ?? NSImage()
    var body: some View {
      ScrollView {
        TextField("Path:", text: $message)
          .padding(.all)
        Image(nsImage: image)
          .padding(100)
          .background(.white)
          .onDrop(of: [.fileURL, .item], isTargeted: nil, perform: {
            providers, _ in
            _ = providers.first!.loadObject(ofClass: NSPasteboard.PasteboardType.self) {
              pasteboarItem, _ in
              message = URL(string: pasteboarItem!.rawValue)!.absoluteString
            }
            
            // display image
            providers.first!.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
              if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
//                image = NSImage(contentsOf: url) ?? NSImage()
                image = NSImage(contentsOf: URL(string: "https://media.timeout.com/images/105918414/1372/772/image.jpg")!) ?? NSImage()
              }
            })

            return true
          })
        Button("Sign in") {
          signIn()
        }
        Spacer()
      }
      .navigationTitle("LoadLocalImage")
    }
}

struct LoadLocalImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadLocalImage()
    }
}
