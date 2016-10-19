//
//  TutorialViewController.swift
//  AppCodaAssignment
//
//  Created by Kory E King on 10/19/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var tutorialURL : NSURL!
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var toobar: UIToolbar!
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    
    var tutorialsButtonItem : UIBarButtonItem!
    
    var publishDate : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        webview.hidden = true
        toobar.hidden = true
        tutorialsButtonItem = UIBarButtonItem(title: "Tutorials", style: UIBarButtonItemStyle.Plain, target: self, action: "showTutorialsViewController")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFirstViewControllerDisplayModeChangeWithNotification:"), name: "PrimaryVCDisplayModeChangeNotification", object: nil)

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
                if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact{
                    toobar.items?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
                }
            }
        }
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        
        return true
    }
    

    @IBAction func showPublishDate(sender: AnyObject) {
       let popoverViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idPopoverViewController") as? PopoverViewController
        
        popoverViewController?.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        popoverViewController?.popoverPresentationController?.delegate = self
        
        self.presentViewController(popoverViewController!, animated: true, completion: nil)
        
        popoverViewController?.popoverPresentationController?.barButtonItem = pubDateButtonItem
        popoverViewController?.popoverPresentationController?.permittedArrowDirections = .Any
        popoverViewController?.preferredContentSize = CGSizeMake(200.0, 80.0)
        
        popoverViewController?.lblMessage.text = "Publish Date:\n\(publishDate)"
        
    }
    
    func showTutorialsViewController(){
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }
    
    func targetDisplayModeForActionInSplitViewController(svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
        return UISplitViewControllerDisplayMode.PrimaryHidden
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func handleFirstViewControllerDisplayModeChangeWithNotification(notification: NSNotification){
        let displayModeObject = notification.object as? NSNumber
        let nextDisplayMode = displayModeObject?.integerValue
        
        if toobar.items?.count == 3{
            toobar.items?.removeAtIndex(0)
        }
        
        if nextDisplayMode == UISplitViewControllerDisplayMode.PrimaryHidden.rawValue {
            toobar.items?.insert(tutorialsButtonItem, atIndex: 0)
        }
        else{
            toobar.items?.insert(splitViewController!.displayModeButtonItem(), atIndex: 0)
        }
    }
    
  /*  override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
        if previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.Compact{
            let firstItem = toobar.items?[0] as UIBarButtonItem!
            if firstItem?.title == "Tutorials"{
                toobar.items?.removeAtIndex(0)
            }
        }
        else if previousTraitCollection!.verticalSizeClass == UIUserInterfaceSizeClass.Regular{
            if toobar.items?.count == 3{
                toobar.items?.removeAtIndex(0)
            }
            
            if splitViewController?.displayMode == UISplitViewControllerDisplayMode.PrimaryHidden {
                toobar.items?.insert(tutorialsButtonItem, atIndex: 0)
            }
            else{
                toobar.items?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
            }
        }
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
