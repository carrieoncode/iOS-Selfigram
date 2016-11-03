//
//  ViewController.swift
//  Selfigram
//
//  Created by Sam Meech-Ward on 2016-10-26.
//  Copyright © 2016 Sam Meech-Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Selfigram-logo"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

