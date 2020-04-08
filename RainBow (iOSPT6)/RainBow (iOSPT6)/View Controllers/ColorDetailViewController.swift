//
//  ColorDetailViewController.swift
//  RainBow (iOSPT6)
//
//  Created by Sammy Alvarado on 4/7/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var cellColor: Color?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        if let color = cellColor {
            title = color.colorName
            view.backgroundColor = color.color
        }
    }

}
