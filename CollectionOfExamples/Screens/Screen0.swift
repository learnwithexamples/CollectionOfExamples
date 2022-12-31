//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct Screen0: View {
  @AppStorage("screen") var nScreen: Int = 1
  
  var body: some View {
    ZStack {
      if nScreen == 1 {
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
