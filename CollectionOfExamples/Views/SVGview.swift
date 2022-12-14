import SwiftUI
import WebKit

struct SVGView: NSViewRepresentable {
    @Binding var svgString: String
    let meta = "<meta name=\"viewport\" content=\"initial-scale=1.0\" />"
    
    private let header = "<html>"
    private let style =
        """
        <style>
        html, body { margin:0; padding:0; overflow:hidden }
        svg { position:fixed; top:0; left:0; height:100%; width:100% }
        </style>
        <body>
        """
    private let footer = "</body></html>"
    
    private let webView: WKWebView
    
    func makeNSView(context: Context) -> WKWebView {
        return self.webView
    }
    
    func updateNSView(_ uiView: WKWebView, context: Context) {
        if self.svgString != context.coordinator.lastLoadedString {
            context.coordinator.lastLoadedString = self.svgString
            
//          let htmlString = self.header + self.style + "<meta name=\"viewport\" content=\"initial-scale=1.0\"/>" + self.svgString + self.footer
          let htmlString = self.svgString
            uiView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: SVGView
        var lastLoadedString = ""
        
        init(_ parent: SVGView) {
            self.parent = parent
        }
    }
    
    init(svgString: Binding<String>) {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = false // JavaScript is not needed
        let config = WKWebViewConfiguration()
        config.preferences = preferences
        
        let webView = WKWebView(frame: CGRect(), configuration: config)
        
//        webView.isOpaque = false
//        webView.backgroundColor = .clear
//        webView.isUserInteractionEnabled = false // to disable pinch gesture and scrolling
        self.webView = webView
        self._svgString = svgString
    }
}

struct SVGView_Previews: PreviewProvider {
    static var previews: some View {
        SVGView(svgString: .constant(    """
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
    """
))
//            .frame(width: 200, height: 100)
                    .previewDevice("iPhone SE")
    }
}
