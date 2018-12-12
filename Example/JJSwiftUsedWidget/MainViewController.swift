//
//  MainViewController.swift
//  JJSwiftUsedWidget_Example
//
//  Created by snailjj on 2018/12/12.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var titles = ["支付密码界面", "圆形倒计时"]
    @IBOutlet weak var aTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

enum MainFunction: String {
    case paymentCodeInputView = "支付密码界面"
    case circleCountDownView = "圆形倒计时"
    case `default` = "暂无"
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "MainTableViewCell")
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = titles[indexPath.section]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let functionn = MainFunction(rawValue: titles[indexPath.section]) ?? .default
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        vc.function = functionn
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
