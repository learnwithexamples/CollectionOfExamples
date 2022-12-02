//
//  DispImage.swift
//  CollectionOfExamples
//
//  Created by Learn with Examples on 12/1/22.
//

import SwiftUI

struct DispImage: View {
  @State var imageName: String
  var body: some View {
    let image = NSImage(contentsOf: URL(string: imageName)!)
    Image(nsImage: image ?? NSImage())
  }
}

struct DispImage_Previews: PreviewProvider {
    static var previews: some View {
        DispImage(imageName: "file:///Users/learnwithexamples/github/CollectionOfExamples/resources/bob.png")
    }
}
