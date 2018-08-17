//
//  MovieDetailVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/9.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    var movieId = NSString()
    var rankIndex = NSInteger()
    var isDisappear = true
    
    var dataArr:NSMutableArray = NSMutableArray()
    var infoDic:NSDictionary = NSDictionary()
    
    var lineLabel:UILabel = UILabel()
    var btnArr:NSMutableArray = NSMutableArray()
    var cellType = 1000
    
    var imageAlpha = CGFloat()
    
    let sectionHeadView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 50))
    
    
    let commentArr = [["headImg":"headImg.jpg","isSupport":"true","name":"陌上花开","supportCount":"5789","content":"没想到黄渤居然拍了一出魔幻现实主义，故事相当好，但黄渤并没有被故事支配，十分自如的展现了自己的影像想法，作为处女作非常成熟。虽然片子也有些这样那样的遗憾，但该有的荒诞，该有的黑暗都成功地表达了出来，即便不带“演员跨界执导”的滤镜，这也是一年中排的上号的国产佳片。"],["headImg":"1.jpg","isSupport":"false","name":"无可奈何","supportCount":"5571","content":"1.与世孤绝的荒岛群像，物竞天择的社会缩影。2.没想到，黄渤真的拍了个“蝇王”式的反乌托邦寓言；无论票房口碑如何，这样的尝试已然足够攒脸。3.那场倒置船戏挺魔幻，有种集体着魔的快感，曾剑的摄影很加分。4.的确，这样一部电影，在华语影坛还不曾出现过同类。"],["headImg":"2.jpg","isSupport":"false","name":"嵇","supportCount":"4975","content":"澳洲提前上映看完觉得比期待要好 zyx演技真的不怎么样 和舒淇的感情线有点不必要 中途穿插的一些画面超级尬 但可以看出黄渤对于电影还是有一些思考的"],["headImg":"3.jpg","isSupport":"true","name":"天王盖地虎","supportCount":"4356","content":"人类社会简明发展史，容量有限群戏捉襟见肘，话剧可能是这个荒诞戏码更好的载体，不过你们的张艺兴确实上了一个台阶。"],["headImg":"1.jpg","isSupport":"false","name":"无聊的生活","supportCount":"3954","content":"黄渤是有追求的导演，之前真没敢报期望。中国式反乌托邦，以为会是麻花式的喜剧，会在老本行上偷懒，但远远挖掘了更深层次的东西，这对于处女作来说实属不易。体制内无法呈现的阴暗面，以巧妙的抉择呈现，效果惊艳。美术、音乐以及表演掌控自如，恭喜黄渤"],["headImg":"3.jpg","isSupport":"false","name":"咕噜咕噜","supportCount":"3578","content":"荒诞中揭示人性，导演处女作应该说太用心了，简直就是想费力而不只是想讨好(巧)观众；场景和特效都非常认真，荒岛，破船的造型……电影就是高度文明的人再退回到猴子原始时代的现代寓言，这也足见一个酝酿多年的演而优则导的处女作的良苦『野心』，如果多一些这样的的导演，那么我们的国产電影好看了"],["headImg":"2.jpg","isSupport":"false","name":"叫花子","supportCount":"2867","content":"新导演的通病，想要的太多，逻辑的混乱，节奏的缺失，铺垫的冗长，演员过于夸张的表演，物资充盈的“荒岛”，人性的拷问毫无说服力，因为黄渤，我反而更失望"],["headImg":"headImg.jpg","isSupport":"false","name":"冲天炮","supportCount":"2140","content":"就很费劲大张旗鼓地拍了一个新概念作文，又硬塞进来许多商业诉求，真不如直接做个话剧……"]]
    
    let discussArr = [["headImg":"headImg.jpg","name":"陌上花开","supportCount":"5789","messageCount":"124","time":"1小时前更新","content":"没想到黄渤居然拍了一出魔幻现实主义，"],["headImg":"1.jpg","name":"无可奈何","supportCount":"5571","messageCount":"115","time":"8小时前更新","content":"与世孤绝的荒岛群像，物竞天择的社会缩影。"],["headImg":"2.jpg","name":"嵇","supportCount":"4975","messageCount":"98","time":"8小时前更新","content":"澳洲提前上映看完觉得比期待要好 zyx演技真的不怎么样"],["headImg":"3.jpg","name":"天王盖地虎","supportCount":"4356","messageCount":"248","time":"10小时前更新","content":"人类社会简明发展史，容量有限群戏捉襟见肘"],["headImg":"1.jpg","name":"无聊的生活","supportCount":"3954","messageCount":"9","time":"1天前更新","content":"黄渤是有追求的导演，之前真没敢报期望。"],["headImg":"3.jpg","name":"咕噜咕噜","supportCount":"3578","messageCount":"88","time":"3天前更新","content":"荒诞中揭示人性，导演处女作应该说太用心了"]]
    
    
    fileprivate lazy var headView:MovieDetailHeadview = { [weak self] in
        let bView = MovieDetailHeadview(frame: CGRect(x: 0, y: 0, width: MainWidth, height: 0))
        bView.delegate = self
        bView.isHidden = true
        return bView
        }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tab = UITableView(frame: CGRect(x: 0, y: -TopNavBarHeight, width: MainWidth, height: MainHeight + TopNavBarHeight), style: UITableViewStyle.plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = BACKGROUNGCOLOR
        tab.tableFooterView = UIView()
        tab.tableHeaderView = self.headView
        tab.isHidden = true
        tab.register(MovieCommentListCell.self, forCellReuseIdentifier: "COMMENTLISTCELL")
        tab.register(MovieDiscussListCell.self, forCellReuseIdentifier: "DISCUSSLISTCELL")
        return tab
        }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController?.navigationBar.isTranslucent = true
        //解决手势侧滑但不返回上一个界面时 重新回到页面 导航栏颜色问题
        if self.isDisappear == true {
            self.navigationController?.navigationBar.setBackgroundImage(self.halfAlphaBlackImage(imageAlpha: 0, viewColor: MAINCOLOR),for: .default)
        }
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.isDisappear = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.isTranslucent = false
        if self.isDisappear == true {
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        }
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = BACKGROUNGCOLOR
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let icon = UIImage(named: "backUp")?.withRenderingMode(.alwaysOriginal)
        let leftItem = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(leftItemTouch))
        self.navigationItem.leftBarButtonItem = leftItem
        
        print(message: movieId)
        GETACtion()
        
        self.view.addSubview(self.tableView)
        
        loadData()
        
        self.createHeadBtnView()
    }
    
    @objc private func leftItemTouch() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadData() {
        
        for i in 0..<commentArr.count {
            let model = MovieDetailCommentsModel()
            model.initWithDic(infoDic: commentArr[i] as NSDictionary)
            dataArr.add(model)
        }
        self.tableView.reloadData()
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

extension MovieDetailVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        return sectionHeadView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType == 1000 ? dataArr.count : discussArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellType == 1000 {
            let cell:MovieCommentListCell = MovieCommentListCell()
            let model = dataArr[indexPath.row] as! MovieDetailCommentsModel
            return cell.cellHeight(contentStr:model.content!)
        }else{
            let cell:MovieDiscussListCell = MovieDiscussListCell()
            let infoDic = discussArr[indexPath.row]
            return cell.cellHeight(contentStr:infoDic["content"]! as NSString)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cellType == 1000 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "COMMENTLISTCELL", for: indexPath) as! MovieCommentListCell
            cell.refreshUI(model: dataArr[indexPath.row] as! MovieDetailCommentsModel)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DISCUSSLISTCELL", for: indexPath) as! MovieDiscussListCell
            cell.refreshUI(contentDic: discussArr[indexPath.row] as NSDictionary)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MovieDetailVC {
    
    func createHeadBtnView() {
        
        sectionHeadView.backgroundColor = BACKGROUNGCOLOR
        let arr = ["评论","讨论区"]
        for i in 0..<arr.count {
            let nBtn = UIButton()
            nBtn.frame = CGRect(x: (MainWidth/2)*CGFloat(i), y: 0, width: MainWidth/2, height: 50)
            nBtn.setTitle(arr[i], for: UIControlState.normal)
            nBtn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
            nBtn.setTitleColor(UIColor.black, for: UIControlState.selected)
            nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            nBtn.tag = 1000+i
            nBtn.addTarget(self, action: #selector(btnClick(sender:)), for: UIControlEvents.touchUpInside)
            sectionHeadView.addSubview(nBtn)
            btnArr.add(nBtn)
            if i==0 {
                nBtn.isSelected = true
            }
        }
        
        self.lineLabel.frame = CGRect(x: 0, y: 49.5, width: MainWidth/2, height: 0.5)
        self.lineLabel.backgroundColor = UIColor.black
        self.lineLabel.text = ""
        sectionHeadView.addSubview(self.lineLabel)
    }
    
    func btnClick(sender:UIButton?) {
        
        cellType = (sender?.tag)!
        for i in 0..<btnArr.count {
            let btn = btnArr[i] as? UIButton
            btn?.isSelected = false
        }
        sender?.isSelected = true
        
        UIView.animate(withDuration: 0.2) {
            self.lineLabel.frame = CGRect(x: (sender?.frame.origin.x)!, y: self.lineLabel.frame.origin.y, width: self.lineLabel.frame.width, height: 0.5)
        }
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.reloadData()
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
        
        self.imageAlpha = imgAlpha
        
        //Mark:tableView sectionHeadView 悬停问题
        if offsetY >= self.headView.headViewHeight()-128 {
            self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        }else{
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
}

extension MovieDetailVC: MovieDetialHeadViewDelegate {
    
    func showAllSum() {
        self.headView.refreshUI(infoDic: self.infoDic , index: self.rankIndex)
        self.headView.frame = CGRect(x: 0, y: 0, width: MainWidth, height: self.headView.headViewHeight())
        self.tableView.reloadData()
    }
    
    func actorDetailInfo(name: NSString) {
        self.isDisappear = false
        let actorInfoVC = MovieActorInfoVC()
        actorInfoVC.title = name as String
        actorInfoVC.callBackBlock {
            
            if self.imageAlpha == 1 {
                self.tableView.frame = CGRect(x: 0, y: -TopNavBarHeight, width: MainWidth, height: MainHeight)
            }
        }
        self.navigationController?.pushViewController(actorInfoVC, animated: true)
        
    }
}
