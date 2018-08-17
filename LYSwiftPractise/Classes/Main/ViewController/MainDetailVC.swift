//
//  MainDetailVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MainDetailVC: BaseViewController {

    var jsonDic = NSDictionary()
    
    
    fileprivate lazy var headView:GoodsDetailHeadView = { [unowned self] in
        let nView:GoodsDetailHeadView = GoodsDetailHeadView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainWidth + 240))
        return nView
        }()
    
    fileprivate lazy var footerView:GoodsDetailFooterView = { [unowned self] in
        let nView:GoodsDetailFooterView = GoodsDetailFooterView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 60 + (MainHeight - TopNavBarHeight - 50)*3))
        return nView
        }()
    
    fileprivate lazy var chooseTypeView:ChooseGoodsTypeView = { [unowned self] in
        let nView:ChooseGoodsTypeView = ChooseGoodsTypeView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight))
        return nView
        }()
    
    private func loadData() {
        
        let path = Bundle.main.path(forResource:"product", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
        self.jsonDic = jsonDic
//        print(message: jsonDic)
//        let arr = jsonDic["subjects"] as? NSArray
//        for i in 0..<arr!.count {
//            let model = DBMovieTopListModel()
//            model.initWithDic(infoDic: (arr![i] as? NSDictionary)!)
//            dataArr.append(model)
//        }
//        self.tableView.reloadData()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "小米8"
        
        self.tableView.frame = CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight - TopNavBarHeight - 50)
        self.tableView.tableHeaderView = self.headView
        self.tableView.tableFooterView = self.footerView
        self.view.addSubview(self.tableView)
        self.tableView.register(GoodsEvaluationListCell.self, forCellReuseIdentifier: "EVALUATIONLISTCELL")
        
        createBottomView()
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBottomView() {
        
        let bottomView = UIView(frame: CGRect(x: 0, y: MainHeight - TopNavBarHeight - 50, width: MainWidth, height: 50))
        bottomView.backgroundColor = MAINCOLOR
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: MainWidth, height: 50)
        btn.setTitle("加入购物车", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.addTarget(self, action: #selector(addShopCartClick), for: UIControlEvents.touchUpInside)
        bottomView.addSubview(btn)
        self.view.addSubview(bottomView)
    }
    
    func addShopCartClick() {
        self.chooseTypeView.refreshUI(infoDic: self.jsonDic)
        self.chooseTypeView.showView()
    }
}

extension MainDetailVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "EVALUATIONLISTCELL", for: indexPath) as! GoodsEvaluationListCell

        return cell
        
    }
}
