//
//  ViewController.swift
//  HackingWithSwift-Project4
//
//  Created by Ahuja, Abhishek on 4/17/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webview : WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"]
    var unallowedWebsites = ["facebook.com"]
    override func loadView() {
        webview = WKWebView()
        webview.navigationDelegate = self
        view=webview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webview, action: #selector(webview.reload))
        let backButton  = UIBarButtonItem(title: "Back", style: .plain, target: webview, action: #selector(webview.goBack))
        let forward  = UIBarButtonItem(title: "forward", style: .plain, target: webview, action: #selector(webview.goForward))
        toolbarItems = [backButton, forward, progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        guard let url = URL(string: "https://" + websites[0]) else { fatalError("invalid url") }
        print(url)
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
        webview.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context:  nil)
    }
    @objc func openTapped() {
        let ac = UIAlertController(title: "open page...", message: nil, preferredStyle: .actionSheet)
        let totalWebsites = websites + unallowedWebsites
        totalWebsites.forEach {
            website in
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)

    }
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webview.load(URLRequest(url: url))
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webview.title
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url  = navigationAction.request.url
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    print("Entered")
                    decisionHandler(.allow)
                    return
                }
            }
            let dialogMessage = UIAlertController(title: "Invalid URL", message: "You are not allowed to visit this website", preferredStyle: .alert)
            let okAction = UIAlertAction(title : "OK", style: .default) {
                _ in
            }
            dialogMessage.addAction(okAction)
            present(dialogMessage, animated: true, completion: nil)
        }
        decisionHandler(.cancel)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //whenever the property changes, update the progress bar
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webview.estimatedProgress)
        }
    }
}

