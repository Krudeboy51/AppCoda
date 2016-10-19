//
//  TutorialViewController.swift
//  AppCodaAssignment
//
//  Created by Kory E King on 10/19/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var tutorialURL : NSURL!
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var toobar: UIToolbar!
  //  @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        webview.hidden = true
        toobar.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: tutorialURL)
            webview.loadRequest(request)
            
            if webview.hidden {
                webview.hidden = false
                toobar.hidden = false
            }
        }
    }
    

    @IBAction func showPublishDate(sender: AnyObject) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
