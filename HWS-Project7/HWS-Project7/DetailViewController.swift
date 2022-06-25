//
//  DetailViewController.swift
//  HWS-Project7
//
//  Created by Ahuja, Abhishek on 4/22/22.
//

import Foundation
import WebKit
import UIKit

class DetailViewController: UIViewController  {
    var webView : WKWebView!
    var detailItem : Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailItem = detailItem else {
            return
        }
        let html = """
    <html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style> body { font-size: 150%; } </style>
    </head>
    <body>
    \(detailItem.body)
    </body>
    </html>
    """
        webView.loadHTMLString(html, baseURL: nil)
    }

}
