//
//  DetailViewController.swift
//  Final Test MAD 310
//
//  Created by Jesse viau on 2021-12-15.
//

import UIKit
import WebKit
// conforms to the UIView controller
class DetailViewController: UIViewController {
    
    
    var webView: WKWebView!
    var detailItem: Company?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else {
            return
        }

        /*
         HTML template, this is what is going to appear on the details portion of whatever the user clicks initally
         
         its going to show:
         product
         company name
         duns number
         company address
         contact name
         contact phone
         contact email
         
          will then load the html string into the webview
         */
        let html = """
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=">
<style> body {font-size: 150%} </style>
</head>
<body>
<h1>\(detailItem.product)</h1>

<h3>Company Name</h3>
\(detailItem.companyName)

<h3>DUNZ#</h3>
\(detailItem.dunsNumber)

<h3>Address</h3>
\(detailItem.companyAddress)

<h3>Contact Name</h3>
\(detailItem.contactName)

<h3>Phone</h3>
\(detailItem.contactPhone)

<h3>Email</h3>
\(detailItem.contactEmail)

"""
        webView.loadHTMLString(html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
