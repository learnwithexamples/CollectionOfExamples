// https://stackoverflow.com/questions/66581811/call-evaluatejavascript-from-a-swiftui-button

import Combine
import SwiftUI
import WebKit

class WebViewData: ObservableObject {
    @Published var parsedText: NSAttributedString? = nil

    var functionCaller = PassthroughSubject<Void,Never>()
    
    var isInit = false
    var shouldUpdateView = true
}

struct WebView2: NSViewRepresentable {
    let text: String
    @StateObject var data: WebViewData

    func makeNSView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        return webview
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        guard data.shouldUpdateView else {
            data.shouldUpdateView = false
            return
        }

        context.coordinator.tieFunctionCaller(data: data)
        context.coordinator.webView = nsView
        
        let html = """
            <html>
                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
                </head>
                <body>
                    \(text)

                <script>
                    function doAlert() { document.body.innerHTML += "hi"; }
                </script>
                </body>
            </html>
        """

        nsView.loadHTMLString(html, baseURL: nil)
    }

    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator(view: self)
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var parent: WebView2
    var webView: WKWebView? = nil

    private var cancellable : AnyCancellable?
    
    init(view: WebView2) {
        self.parent = view
        super.init()
    }
    
    func tieFunctionCaller(data: WebViewData) {
        cancellable = data.functionCaller.sink(receiveValue: { _ in
            self.webView?.evaluateJavaScript("doAlert()")
        })
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            if !self.parent.data.isInit {
                self.parent.data.isInit = true
                // useless text parsing here...
            }
        }
    }
}


struct ReadingView: View {
    @StateObject var webViewData = WebViewData()
    var text : String

    init(text: String?) {
        self.text = text ?? "Sorry, this reading is empty"
    }

    var body: some View {
        VStack {
            Button("Call javascript") {
                webViewData.functionCaller.send()
            }
            WebView2(text: text, data: webViewData)
        }
        .onReceive(webViewData.$parsedText, perform: { parsedText in
            if let parsedText = parsedText {
               print(parsedText)
            }
        })
    }
}
struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
      ReadingView(text: "sdfsfsdf")
    }
}
