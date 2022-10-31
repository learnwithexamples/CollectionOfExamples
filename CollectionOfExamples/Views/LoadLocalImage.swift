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
        HStack {
          TextField("Path:", text: $message)
            .padding(.all)
        }
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
              if let data = data, let path = NSString(data: data, encoding: 4), var url = URL(string: path as String) {
                image = NSImage(contentsOf: url) ?? NSImage()
//                image = NSImage(contentsOf: URL(string: "https://media.timeout.com/images/105918414/1372/772/image.jpg")!) ?? NSImage()
//                image = NSImage(contentsOf: URL(string: "file:////Users/learnwithexamples/Downloads/witch.svg")!) ?? NSImage()
              }
            })
            return true
          })
        DisplayHtml(htmlString: .constant("""
    <svg height="150" width="400" style="border:1px solid black">
      <defs>
        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" />
          <stop offset="100%" style="stop-color:rgb(255,0,0);stop-opacity:1" />
        </linearGradient>
      </defs>
      <ellipse cx="200" cy="70" rx="85" ry="55" fill="url(#grad1)" />
      <text fill="#ffffff" font-size="45" font-family="Verdana" x="150" y="86">SVG</text>
      Sorry, your browser does not support inline SVG.
    </svg>
    """))
        .frame(width: 500, height: 50)
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
