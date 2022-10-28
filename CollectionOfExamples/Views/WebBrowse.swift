import SwiftUI
import WebKit

// https://stackoverflow.com/questions/67470061/type-swiftuiwebview-does-not-conform-to-protocolnsviewrepresentable
// https://www.appsloveworld.com/swift/100/94/execute-javascript-confirm-in-swiftui-using-wkwebview

struct WebBrowse: View {
    var body: some View {
      WebView(url: URL(string: "https://nrexplained.com"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("WebBrowse")
    }
}

struct WebView: NSViewRepresentable {
  let url: URL?
  func makeNSView(context: Context) -> WKWebView {
      let prefs = WKWebpagePreferences()
      prefs.allowsContentJavaScript = true
      let config = WKWebViewConfiguration()
      config.defaultWebpagePreferences = prefs
      let webView = WKWebView(frame: .zero, configuration: config)
      return webView
  }
  
  func updateNSView(_ nsView: WKWebView, context: Context) {
      guard let myURL = url else {
          return
      }
      let request = URLRequest(url: myURL)
      nsView.load(request)
  }
}

struct WebBrowse_Previews: PreviewProvider {
    static var previews: some View {
      WebBrowse()
    }
}
