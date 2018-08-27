//
//  MineVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MineVC: UIViewController {
    
    var arr = [["热气球","沙滩","地球仪","捕蝶","风扇","路标","火车票"],["设置"]]
    
    fileprivate lazy var tableView:UITableView = { [unowned self] in
        let nTab:UITableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight - TopNavBarHeight), style: UITableViewStyle.grouped)
        nTab.delegate = self
        nTab.dataSource = self
        nTab.backgroundColor = BACKGROUNGCOLOR
        return nTab
    }()
    
    var mjHeader:MJRefreshNormalHeader = MJRefreshNormalHeader()
    var mjFooter:MJRefreshBackNormalFooter = MJRefreshBackNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = MAINCOLOR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.view.backgroundColor = BACKGROUNGCOLOR
        
        self.view.addSubview(self.tableView)
        
        mjHeader.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        mjFooter.setRefreshingTarget(self, refreshingAction: #selector(loadMoreData))
        
        self.tableView.mj_header = mjHeader
        self.tableView.mj_footer = mjFooter
    }
    
    func headerRefresh() {
     
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            self.tableView.mj_header.endRefreshing()
        }
    }
    
    func loadMoreData() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            self.tableView.mj_footer.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MineVC:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 10))
        view.backgroundColor = BACKGROUNGCOLOR
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowArr = arr[section]
        return rowArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resuId = "resuId"
        var cell = tableView.dequeueReusableCell(withIdentifier: resuId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: resuId)
        }
        let rowArr = arr[indexPath.section]
        cell?.textLabel?.text = rowArr[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell?.imageView?.image = UIImage(named: rowArr[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
