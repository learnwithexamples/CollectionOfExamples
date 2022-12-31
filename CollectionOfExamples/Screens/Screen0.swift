//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct Screen0: View {
  @AppStorage("screen1") var isScreen1: Bool = true
  
  var body: some View {
    ZStack {
      if isScreen1 {
        Screen1()
      } else {
        Screen2()
      }
    }
  }
}

struct Screen0_Previews: PreviewProvider {
  static var previews: some View {
    Screen0()
  }
}
