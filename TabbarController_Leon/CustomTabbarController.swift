//
//  CustomTabbarController.swift
//  TabbarController_Leon
//
//  Created by lai leon on 2017/12/8.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width
let YHNoNavRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 64)
let YHNoTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 49)
let YHNoNavTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight - 49 - 64)

class CustomTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        let avc = CVC(picName: "Explore")
        avc.title = "AVC"
        avc.tabBarItem.title = "A"
        avc.tabBarItem.image = UIImage(named: "Game")

        let bvc = CVC(picName: "Game")
        bvc.title = "BVC"
        bvc.tabBarItem.title = "B"
        bvc.tabBarItem.image = UIImage(named: "Home")

        let cvc = CVC(picName: "Preview")
        cvc.title = "CVC"
        cvc.tabBarItem.title = "C"
        cvc.tabBarItem.image = UIImage(named: "Setting")

        viewControllers = [avc, bvc, cvc]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //强制跳转到B页面
        selectedIndex = 1
        selectedViewController = viewControllers?[selectedIndex]
    }
}
