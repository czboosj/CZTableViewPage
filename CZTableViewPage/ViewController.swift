//
//  ViewController.swift
//  CZTableViewPage
//
//  Created by boosj on 2017/11/7.
//  Copyright © 2017年 boosjcz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var showView:ShowTableViewPageView!
    var showView2:ShowScrollViewPageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.showView = ShowTableViewPageView(frame: self.view.bounds)
//        self.view.addSubview(self.showView)
//        self.showView.backgroundColor = UIColor.red
        
        self.showView2 = ShowScrollViewPageView(frame: self.view.bounds)
        self.view.addSubview(self.showView2)
        self.showView2.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

