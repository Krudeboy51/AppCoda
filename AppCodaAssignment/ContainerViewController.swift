//
//  ContainerViewController.swift
//  AppCodaAssignment
//
//  Created by Kory E King on 10/19/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var viewController : UISplitViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setEmbeddedViweController(splitViewController: UISplitViewController){
        
        viewController = splitViewController
        self.addChildViewController(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
        
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
