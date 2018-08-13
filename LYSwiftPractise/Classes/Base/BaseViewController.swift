//
//  BaseViewController.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/9.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UIGestureRecognizerDelegate {
    
//    var tabStyle = 0
    
//    lazy var tableView: UITableView = { [unowned self] in
//        let tab = UITableView(frame: CGRect.zero, style: self.tabStyle == 0 ? UITableViewStyle.plain : UITableViewStyle.grouped)
//        tab.delegate = self
//        tab.dataSource = self
//        tab.backgroundColor = BACKGROUNGCOLOR
//        tab.tableFooterView = UIView()
//        return tab
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = MAINCOLOR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let icon = UIImage(named: "backUp")?.withRenderingMode(.alwaysOriginal)
        let leftItem = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(leftItemTouch))
        self.navigationItem.leftBarButtonItem = leftItem
        
        self.self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
//        self.view.addSubview(self.tableView)
    }
    
    //是否允许手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer) {
            //只有二级以及以下的页面允许手势返回
            return self.navigationController!.viewControllers.count > 1
        }
        return true
    }

    @objc private func leftItemTouch() {
        guard self.navigationController != nil else { return }
        
        self.navigationController?.popViewController(animated: true)
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

//extension BaseViewController: UITableViewDelegate , UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        return cell
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
//        view.backgroundColor = UIColor.clear
//        return view
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
//        view.backgroundColor = UIColor.clear
//        return view
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//    }
//    
//}


