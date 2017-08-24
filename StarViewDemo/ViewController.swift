//
//  ViewController.swift
//  StarViewDemo
//
//  Created by Lee on 2017/8/24.
//  Copyright © 2017年 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let starView = EvaluateStarView(frame: CGRect(x: 50, y: 300, width: view.frame.width - 100, height: (view.frame.width - 100) * 0.2))
        view.addSubview(starView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

