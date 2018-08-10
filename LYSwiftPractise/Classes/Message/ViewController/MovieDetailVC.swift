//
//  MovieDetailVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/9.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieDetailVC: BaseViewController {
    
    var movieId = NSString()
    var rankIndex = NSInteger()
    
    var dataArr:[NSObject] = [NSObject]()
    var infoDic:NSDictionary = NSDictionary()
    
    fileprivate lazy var headView:MovieDetailHeadview = { [weak self] in
        let bView = MovieDetailHeadview(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
        bView.isHidden = true
        return bView
        }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(),for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = BACKGROUNGCOLOR
        
        print(message: movieId)
        GETACtion()
        
        self.tableView.frame = CGRect(x: 0, y: -TopNavBarHeight, width: MainWidth, height: MainHeight + TopNavBarHeight)
        self.tableView.tableHeaderView = self.headView
        self.tableView.isHidden = true
        self.view.addSubview(self.tableView)
        self.tableView.rowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     GET请求
     */
    func GETACtion() {
        //请求URL
        let url:NSURL! = NSURL(string: "http://api.douban.com/v2/movie/subject/\(movieId)")
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        let list  = NSMutableArray()
        let paramDic = [String: String]()
        
        if paramDic.count > 0 {
            //设置为GET请求
            request.httpMethod = "GET"
            //拆分字典,subDic是其中一项，将key与value变成字符串
            for subDic in paramDic {
                let tmpStr = "\(subDic.0)=\(subDic.1)"
                list.add(tmpStr)
            }
            //用&拼接变成字符串的字典各项
            let paramStr = list.componentsJoined(by: "&")
            //UTF8转码，防止汉字符号引起的非法网址
            let paraData = paramStr.data(using: String.Encoding.utf8)
            //设置请求体
            request.httpBody = paraData
        }
        //默认session配置
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        //发起请求
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            //转Json
            let jsonData:NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
            print(jsonData)
            self.infoDic = jsonData
//            let arr = jsonData["subjects"] as? NSArray
//            for i in 0..<arr!.count {
//                let model = DBMovieTopListModel()
//                model.initWithDic(infoDic: (arr![i] as? NSDictionary)!)
//                self.dataArr.append(model)
//            }
            
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                self.headView.refreshUI(infoDic: self.infoDic , index: self.rankIndex)
                self.headView.frame = CGRect(x: 0, y: 0, width: MainWidth, height: self.headView.headViewHeight())
                self.tableView.reloadData()
                
            }
            
        }
        //请求开始
        dataTask.resume()
    }
    
}

extension MovieDetailVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resuId = "resuId"
        var cell = tableView.dequeueReusableCell(withIdentifier: resuId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: resuId)
        }
        return cell!
    }
}
