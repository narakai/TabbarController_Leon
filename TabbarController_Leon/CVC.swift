//
//  CVC.swift
//  TabbarController_Leon
//
//  Created by lai leon on 2017/12/8.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class CVC: UIViewController {
    var picName: String?;

    //构造方法
    init(picName: String) {
        //当属性名和参数名相同时  需要加上 self来区分
        self.picName = picName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    //该imageView可以替换成当前页面的快照，利用快照可以做出界面缩放的效果
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: YHRect)
        imageView.alpha = 0
        imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    private func setupView() {
        imageView.image = UIImage(named: picName!)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        imageView.alpha = 0
        imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.imageView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
