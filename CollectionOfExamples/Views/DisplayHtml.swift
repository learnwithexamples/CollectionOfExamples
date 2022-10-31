import SwiftUI
import WebKit

struct DisplayHtml: NSViewRepresentable {
  @Binding var htmlString: String
  private let webView: WKWebView
  func makeNSView(context: Context) -> WKWebView {
    return self.webView
  }
  func updateNSView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
  }
  init(htmlString: Binding<String>) {
    let prefs = WKWebpagePreferences()
    prefs.allowsContentJavaScript = true
    let config = WKWebViewConfiguration()
    config.defaultWebpagePreferences = prefs
    let webView = WKWebView(frame: CGRect(), configuration: config)
    self.webView = webView
    self._htmlString = htmlString
  }
}

struct DisplayHtml_Previews: PreviewProvider {
  static var previews: some View {
    DisplayHtml(htmlString: .constant("""
      Hello world
    """))
  }
}
