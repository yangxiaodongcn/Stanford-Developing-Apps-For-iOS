//
//  ViewController.swift
//  Psychologist
//
//  Created by 杨晓冬 on 16/2/14.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as UIViewController?
        
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "happy": hvc.happiness = 100
                    case "sad": hvc.happiness = 0
                    default: hvc.happiness = 50
                }
            }
        }
    }

}

