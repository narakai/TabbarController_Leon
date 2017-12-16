//
//  BVC.swift
//  TabbarController_Leon
//
//  Created by lai leon on 2017/12/16.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class BVC: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView(frame: YHRect, style: .plain)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()

    let reuseIdentifier = String(describing: UITableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }

    private func animateTable() {
        let cells = tableView.visibleCells
        let height: CGFloat = YHHeight

        for i in cells {
            i.transform = CGAffineTransform(translationX: 0, y: height)
        }
        var index = 0
        for a in cells {
            UIView.animate(withDuration: 1, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: {
                a.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }

    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension BVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        return cell
    }
}

extension BVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
