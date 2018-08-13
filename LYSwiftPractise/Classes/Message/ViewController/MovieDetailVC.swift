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
    var isDisappear = true
    
    var dataArr:[NSObject] = [NSObject]()
    var infoDic:NSDictionary = NSDictionary()
    
    fileprivate lazy var headView:MovieDetailHeadview = { [weak self] in
        let bView = MovieDetailHeadview(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
        bView.delegate = self
        bView.isHidden = true
        return bView
        }()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        let tab = UITableView(frame: CGRect(x: 0, y: -TopNavBarHeight, width: MainWidth, height: MainHeight + TopNavBarHeight), style: UITableViewStyle.plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = BACKGROUNGCOLOR
        tab.tableFooterView = UIView()
        tab.tableHeaderView = self.headView
        tab.isHidden = true
        tab.rowHeight = 100
        return tab
        }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //解决手势侧滑但不返回上一个界面时 重新回到页面 导航栏颜色问题
        if self.isDisappear == true {
            self.navigationController?.navigationBar.setBackgroundImage(self.halfAlphaBlackImage(imageAlpha: 0, viewColor: MAINCOLOR),for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.isDisappear = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.isDisappear = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = BACKGROUNGCOLOR
        
        print(message: movieId)
        GETACtion()
        
        self.view.addSubview(self.tableView)
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
//            print(jsonData)
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

extension MovieDetailVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 40))
        view.backgroundColor = UIColor.red
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0.1))
//        view.backgroundColor = UIColor.clear
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resuId = "resuId"
        var cell = tableView.dequeueReusableCell(withIdentifier: resuId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: resuId)
        }
        return cell!
    }
}


extension MovieDetailVC {
 
    //MAEK: 纯色image 可改变alpha
    func halfAlphaBlackImage(imageAlpha:CGFloat , viewColor:UIColor) -> UIImage {
        let imageSize = CGSize(width: 50, height: 50)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        viewColor.withAlphaComponent(imageAlpha).set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let pressesColorImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return pressesColorImg!
    }
    
    //MARK:scrollView滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alphaChangeBoundary = MainWidth - 128
        let offsetY = scrollView.contentOffset.y
        let imgAlpha = (offsetY)/alphaChangeBoundary
        self.navigationController?.navigationBar.setBackgroundImage(self.halfAlphaBlackImage(imageAlpha: imgAlpha, viewColor: MAINCOLOR),for: .default)
    }
    
}

extension MovieDetailVC: MovieDetialHeadViewDelegate {
    
    func showAllSum() {
        self.headView.refreshUI(infoDic: self.infoDic , index: self.rankIndex)
        self.headView.frame = CGRect(x: 0, y: 0, width: MainWidth, height: self.headView.headViewHeight())
        self.tableView.reloadData()
    }
}
