//
//  MessageVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    
    var dataArr:[NSObject] = [NSObject]()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        let tabV = UITableView(frame: MianScreen, style: UITableViewStyle.plain)
        tabV.delegate = self
        tabV.dataSource = self
        tabV.rowHeight = 140
        tabV.backgroundColor = BACKGROUNGCOLOR
        tabV.register(MovieListCell.self, forCellReuseIdentifier: "MOVIELISTCELL")
        return tabV
    }()
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = MAINCOLOR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.view.addSubview(self.tableView)
        self.navigationController?.delegate = self as? UINavigationControllerDelegate
        self.loadData()
        
    }

    func loadData() {
        
        let path = Bundle.main.path(forResource:"top250", ofType: "json")

        let data = NSData(contentsOfFile: path!)
        
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
//        print(message: jsonDic)
        
        let arr = jsonDic["subjects"] as? NSArray
        for i in 0..<arr!.count {
            let model = DBMovieTopListModel()
            model.initWithDic(infoDic: (arr![i] as? NSDictionary)!)
            dataArr.append(model)
        }
        self.tableView.reloadData()
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        
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


extension MessageVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MOVIELISTCELL", for: indexPath) as! MovieListCell
        let model = dataArr[indexPath.row] as? DBMovieTopListModel
        cell.refreshUIWithModel(model: model!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = dataArr[indexPath.row] as? DBMovieTopListModel
        print(message: model?.movieId)
        let detaiVC = MovieDetailVC()
        detaiVC.movieId = (model?.movieId)!
        detaiVC.rankIndex = indexPath.row + 1
        detaiVC.title = (model?.title)! as String
        self.navigationController?.pushViewController(detaiVC, animated: true)
    }
}
