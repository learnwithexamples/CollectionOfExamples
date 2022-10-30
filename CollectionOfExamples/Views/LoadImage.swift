//
//  LoadImage.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 10/27/22.
//

import SwiftUI

struct LoadImage: View {
  @State var message: String = "Drag file below, or enter path here"
  @State var url:URL = URL(fileURLWithPath: "file:///Users/learnwithexamples/Library/Mobile%20Documents/com~apple~CloudDocs/yuanye/Downloads/IMG_4198.jpg")
//  @State var image = NSImage(systemSymbolName: "plus", accessibilityDescription: nil)
  @State var image = NSImage(contentsOf: URL(string: "file:///Users/learnwithexamples/Library/Mobile%20Documents/com~apple~CloudDocs/yuanye/Downloads/IMG_4198.jpg")!)
  var body: some View {
      ScrollView {
        TextField("Path:", text: $message)
          .padding(.all)
        Image(nsImage: image ?? NSImage())
          .padding(100)
          .background(.white)
          .onDrop(of: [.fileURL, .item], isTargeted: nil, perform: {
            providers, _ in
//            _ = providers.first!.loadObject(ofClass: NSPasteboard.PasteboardType.self) {
//              pasteboarItem, _ in
////              message = URL(string: pasteboarItem!.rawValue)!.absoluteString
//            }
            providers.first!.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
              if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
//                image = NSImage(contentsOf: url)
                message = "This is my \(url.absoluteString)"
                image = NSImage(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = image
                }
//                message = String(error)
              }
//            let image = NSImage(contentsOf: url)
//                  DispatchQueue.main.async {
//                      self.image = image
//                  }
//              }
            })
            
            return true
          })
//        AsyncImage(url: URL(string: "https://media.timeout.com/images/105918414/1372/772/image.jpg"))
//        Image(nsImage: NSImage(data: Data(contentsOf: URL(string: "file:///Users/learnwithexamples/Library/Mobile%20Documents/com~apple~CloudDocs/yuanye/Downloads/IMG_4198.jpg")!)))
//        Image(nsImage: NSImage(byReferencing: URL(string: "file:///Users/learnwithexamples/Library/Mobile%20Documents/com~apple~CloudDocs/yuanye/Downloads/IMG_4198.jpg")!) ?? NSImage())
//        var url : URL = URL(string: "file:///Users/learnwithexamples/Library/Mobile%20Documents/com~apple~CloudDocs/yuanye/Downloads/IMG_4198.jpg") ?? URL()
        Image(nsImage: NSImage(contentsOf: url) ?? NSImage())
        Spacer()
      }
      .navigationTitle("LoadImage")
    }
}

struct LoadImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadImage()
    }
}
