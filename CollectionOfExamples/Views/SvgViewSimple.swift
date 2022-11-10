import SwiftUI
import WebKit

struct SvgViewSimple: NSViewRepresentable {
    @Binding var svgString: String
    private let webView: WKWebView
    func makeNSView(context: Context) -> WKWebView {
        return self.webView
    }
    
    func updateNSView(_ uiView: WKWebView, context: Context) {
      uiView.loadHTMLString(self.svgString, baseURL: Bundle.main.bundleURL)
    }
    init(svgString: Binding<String>) {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = false // JavaScript is not needed
        let config = WKWebViewConfiguration()
        config.preferences = preferences
        let webView = WKWebView(frame: CGRect(), configuration: config)
        self.webView = webView
        self._svgString = svgString
    }
}

struct SvgViewSimple_Previews: PreviewProvider {
    static var previews: some View {
        SvgViewSimple(svgString: .constant("""
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" contentStyleType="text/css" height="208px" preserveAspectRatio="none" style="width:295px;height:208px;background:#FFFFFF;" version="1.1" viewBox="0 0 295 208" width="295px" zoomAndPan="magnify"><defs/><g><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="29" x2="29" y1="36.2969" y2="172.8281"/><line style="stroke:#181818;stroke-width:0.5;stroke-dasharray:5.0,5.0;" x1="267" x2="267" y1="36.2969" y2="172.8281"/><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="49" x="5" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="35" x="12" y="24.9951">Alice</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="49" x="5" y="171.8281"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="35" x="12" y="191.8232">Alice</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="43" x="246" y="5"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="29" x="253" y="24.9951">Bob</text><rect fill="#E2E2F0" height="30.2969" rx="2.5" ry="2.5" style="stroke:#181818;stroke-width:0.5;" width="43" x="246" y="171.8281"/><text fill="#000000" font-family="sans-serif" font-size="14" lengthAdjust="spacing" textLength="29" x="253" y="191.8232">Bob</text><polygon fill="#181818" points="255.5,63.4297,265.5,67.4297,255.5,71.4297,259.5,67.4297" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="29.5" x2="261.5" y1="67.4297" y2="67.4297"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="150" x="36.5" y="62.3638">Authentication Request</text><polygon fill="#181818" points="40.5,92.5625,30.5,96.5625,40.5,100.5625,36.5,96.5625" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;stroke-dasharray:2.0,2.0;" x1="34.5" x2="266.5" y1="96.5625" y2="96.5625"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="160" x="46.5" y="91.4966">Authentication Response</text><polygon fill="#181818" points="255.5,121.6953,265.5,125.6953,255.5,129.6953,259.5,125.6953" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;" x1="29.5" x2="261.5" y1="125.6953" y2="125.6953"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="204" x="36.5" y="120.6294">Another authentication Request</text><polygon fill="#181818" points="40.5,150.8281,30.5,154.8281,40.5,158.8281,36.5,154.8281" style="stroke:#181818;stroke-width:1.0;"/><line style="stroke:#181818;stroke-width:1.0;stroke-dasharray:2.0,2.0;" x1="34.5" x2="266.5" y1="154.8281" y2="154.8281"/><text fill="#000000" font-family="sans-serif" font-size="13" lengthAdjust="spacing" textLength="214" x="46.5" y="149.7622">Another authentication Response</text></g></svg>
    """))
    }
}
