//
//  MovieDetailHeadview.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/10.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

@objc protocol MovieDetialHeadViewDelegate: NSObjectProtocol {

    @objc optional func showAllSum()
}

class MovieDetailHeadview: UIView {
    
    var isShowAll = false
    
    //248 243 240
    fileprivate lazy var backView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor(red: 128.0/255.0, green: 114.0/255.0, blue: 106.0/255.0, alpha: 1)
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var backImgView: UIImageView = { [unowned self] in
        let bImgView:UIImageView = UIImageView()
        bImgView.contentMode = UIViewContentMode.scaleAspectFit
        self.backView.addSubview(bImgView)
        return bImgView
        }()
    
    //MAEK: 评分
    fileprivate lazy var scoreView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor.white
        nView.layer.shadowColor = UIColor.lightGray.cgColor
        nView.layer.shadowOpacity = 1
        //zero表示不偏移
        nView.layer.shadowOffset = CGSize.zero
        nView.layer.shadowRadius = 5
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var scoreTitleLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 12)
        vLabel.textAlignment = NSTextAlignment.center
        vLabel.textColor = UIColor.lightGray
        vLabel.text = "豆瓣评分"
        self.scoreView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var scoreLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 20)
        vLabel.textAlignment = NSTextAlignment.center
        vLabel.text = "-"
        self.scoreView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var scorePeoCountLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 12)
        vLabel.textAlignment = NSTextAlignment.center
        vLabel.textColor = UIColor.darkGray
        vLabel.text = "-"
        self.scoreView.addSubview(vLabel)
        return vLabel
        }()
    
    //MAEK: 其他
    fileprivate lazy var titleLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 17)
        vLabel.text = "-"
        vLabel.numberOfLines = 0
        self.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var colorView1:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor(red: 255.0/255.0, green: 208.0/255.0, blue: 138.0/255.0, alpha: 1)
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var rankLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 13)
        vLabel.text = "-"
        vLabel.textAlignment = NSTextAlignment.center
        vLabel.textColor = UIColor(red: 160.0/255.0, green: 106.0/255.0, blue: 37.0/255.0, alpha: 1)
        self.colorView1.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var colorView2:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor(red: 88.0/255.0, green: 85.0/255.0, blue: 80.0/255.0, alpha: 1)
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var douBanLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 13)
        vLabel.text = "豆瓣Top250"
        vLabel.textAlignment = NSTextAlignment.center
        vLabel.textColor = UIColor(red: 230.0/255.0, green: 200.0/255.0, blue: 135.0/255.0, alpha: 1)
        self.colorView2.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var shortIntrLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 12)
        vLabel.text = "-"
        vLabel.textColor = UIColor.darkGray
        vLabel.numberOfLines = 0
        self.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var wantToWatchBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.layer.borderColor = UIColor(red: 238.0/255.0, green: 180.0/255.0, blue: 34.0/255.0, alpha: 1).cgColor
        nBtn.layer.borderWidth = 0.5
        nBtn.setTitle("想看", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor(red: 238.0/255.0, green: 180.0/255.0, blue: 34.0/255.0, alpha: 1), for: UIControlState.normal)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.layer.cornerRadius = 5
        self.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var watchedBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.layer.borderColor = UIColor(red: 238.0/255.0, green: 180.0/255.0, blue: 34.0/255.0, alpha: 1).cgColor
        nBtn.layer.borderWidth = 0.5
        nBtn.setTitle("看过 ☆☆☆☆☆", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor(red: 238.0/255.0, green: 180.0/255.0, blue: 34.0/255.0, alpha: 1), for: UIControlState.normal)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.layer.cornerRadius = 5
        self.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var summaryTitleLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 12)
        vLabel.text = "剧情简介"
        vLabel.textColor = UIColor.darkGray
        self.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var summaryLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 15)
        vLabel.text = "-"
        vLabel.numberOfLines = 0
        vLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target:self, action: #selector(showAllTap))
        vLabel.addGestureRecognizer(tap)
        self.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var actorTitleLabel:UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 12)
        vLabel.text = "影人"
        vLabel.textColor = UIColor.darkGray
        self.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var actorsView:MovieActorsView = { [unowned self] in
        let nView:MovieActorsView = MovieActorsView()
        self.addSubview(nView)
        return nView
        }()
    
    weak var delegate: MovieDetialHeadViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = UIColor(red: 248.0/255, green: 243.0/255.0, blue: 240.0/255.0, alpha: 1)
        setup()
    }
    
    @objc private func showAllTap() {
        print(message: "单击")
        self.isShowAll = !self.isShowAll
        self.delegate?.showAllSum?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        
        self.backView.snp.makeConstraints { (make) in
            make.top.width.equalToSuperview()
            make.height.equalTo(self.snp.width)
        }
        
        self.backImgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(TopNavBarHeight + 20)
            make.bottom.equalTo(self.backView.snp.bottom).offset(-20)
            make.centerX.equalTo(self.backView.snp.centerX)
            make.width.equalTo(self.bounds.width/2)
        }
        
        self.scoreView.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView.snp.bottom).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
            make.width.height.equalTo(80)
        }
        
        self.scoreTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.scoreView.snp.top).offset(8)
            make.left.right.equalTo(self.scoreView)
            make.height.equalTo(20)
        }
        
        self.scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.scoreTitleLabel.snp.bottom).offset(2)
            make.left.right.equalTo(self.scoreView)
            make.height.equalTo(20)
        }
        
        self.scorePeoCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.scoreLabel.snp.bottom).offset(2)
            make.left.right.equalTo(self.scoreView)
            make.height.equalTo(20)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView.snp.bottom).offset(20)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.scoreView.snp.left).offset(-40)
            make.height.lessThanOrEqualTo(40)
        }
        
        self.colorView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.titleLabel.snp.left)
            make.width.equalTo(50)
            make.height.equalTo(22)
        }
        
        
        self.rankLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.colorView1)
        }
        
        self.colorView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.colorView1.snp.right)
            make.width.equalTo(110)
            make.height.equalTo(22)
        }
        
        self.douBanLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.colorView2)
        }
        
        self.shortIntrLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.colorView1.snp.bottom).offset(8)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.scoreView.snp.left).offset(-40)
            make.height.greaterThanOrEqualTo(20)
        }
        
        self.wantToWatchBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.scoreView.snp.bottom).offset(40)
            make.left.equalTo(self.titleLabel.snp.left)
            make.width.equalTo((MainWidth-50)/3)
            make.height.equalTo(40)
        }
        
        self.watchedBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.wantToWatchBtn.snp.top)
            make.left.equalTo(self.wantToWatchBtn.snp.right).offset(10)
            make.width.equalTo((MainWidth-50)*2/3)
            make.height.equalTo(40)
        }
        
        self.summaryTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.wantToWatchBtn.snp.bottom).offset(30)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.scoreView.snp.right)
            make.height.equalTo(15)
        }
        
        self.summaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.summaryTitleLabel.snp.bottom).offset(8)
            make.left.right.equalTo(self.summaryTitleLabel)
            make.height.greaterThanOrEqualTo(20)
        }
        
        self.actorTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.summaryLabel.snp.bottom).offset(30)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.scoreView.snp.right)
            make.height.equalTo(15)
        }
        
        self.actorsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.actorTitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(130)
        }
        
    }
    
}

extension MovieDetailHeadview {
    
    func refreshUI(infoDic:NSDictionary,index:NSInteger) {
        
        self.isHidden = false
        
        let imagesDic = infoDic["images"] as? NSDictionary
        let largeImg = imagesDic!["large"] as? String
        
        self.backImgView.sd_setImage(with: NSURL(string: largeImg!)! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        
        let title:String = (infoDic["title"] as? String)!
        self.titleLabel.text = title
        
        self.rankLabel.text = "NO.\(index)"
        
        let countryArr = infoDic["countries"] as? NSArray
        let countrystr:String = (countryArr?.componentsJoined(by: " / "))!
        
        let typeArr = infoDic["genres"] as? NSArray
        let typeStr:String = (typeArr?.componentsJoined(by: " / "))!
        
        let originalTitle:String = (infoDic["original_title"] as? String)!
        
        if title == originalTitle {
            self.shortIntrLabel.text = "\(infoDic["year"] as! String) / \(countrystr) / \(typeStr)\n"
        }else{
            self.shortIntrLabel.text = "\(infoDic["year"] as! String) / \(countrystr) / \(typeStr)\n原名:\(infoDic["original_title"] as! String)"
        }

        let ratingDic = infoDic["rating"] as? NSDictionary
        
        let aver = ratingDic!["average"] as? Float64
        let str = String(format: "%.1f", aver!)
//        let average = (ratingDic?["average"] as? NSNumber) ?? NSNumber(value: 0.0)
        let ratingsCount = (infoDic["ratings_count"] as? NSNumber) ?? NSNumber(value: 0)
        
        self.scoreLabel.text = "\(str)"
        self.scorePeoCountLabel.text = "\(ratingsCount)人"
        
        let corners1: UIRectCorner = [.topLeft,.bottomLeft]
        self.colorView1.corner(byRoundingCorners: corners1, radii: 3)
        
        let corners2: UIRectCorner = [.topRight,.bottomRight]
        self.colorView2.corner(byRoundingCorners: corners2, radii: 3)
        
        let height = getSize(with: 12, textWidth: MainWidth - 160, contentStr: self.shortIntrLabel.text! as NSString).height + 1.0 + self.shortIntrLabel.frame.origin.y
        
        if height>scoreView.frame.maxY {
            
            self.wantToWatchBtn.snp.remakeConstraints { (make) in
                make.top.equalTo(self.shortIntrLabel.snp.bottom).offset(40)
                make.left.equalTo(self.titleLabel.snp.left)
                make.width.equalTo((MainWidth-50)/3)
                make.height.equalTo(40)
            }
        }
        
        self.summaryLabel.text = infoDic["summary"] as? String
        let summaryHeight = getSize(with: 15, textWidth: MainWidth - 40, contentStr: self.summaryLabel.text! as NSString).height + 1.0

        if summaryHeight > 100 {
            self.summaryLabel.snp.remakeConstraints { (make) in
                make.top.equalTo(self.summaryTitleLabel.snp.bottom).offset(8)
                make.left.right.equalTo(self.summaryTitleLabel)
                if self.isShowAll == true {
                    make.height.greaterThanOrEqualTo(20)
                }else{
                    make.height.equalTo(100)
                }
            }
        }
        
        let directorArr = infoDic["directors"] as? NSArray
        let actorsArr = infoDic["casts"] as? NSArray
        
        self.actorsView.refreshUI(directorsArr: directorArr!, actorsArr: actorsArr!)
        
    }
    
    
    func headViewHeight() -> CGFloat {
        
        let height = getSize(with: 12, textWidth: MainWidth - 160, contentStr: self.shortIntrLabel.text! as NSString).height + 1.0 + self.shortIntrLabel.frame.origin.y
        var summaryHeight = getSize(with: 15, textWidth: MainWidth - 40, contentStr: self.summaryLabel.text! as NSString).height + 1.0
        summaryHeight = summaryHeight > 100 ? (self.isShowAll == true ? summaryHeight : 100) : summaryHeight
        return height>scoreView.frame.maxY ? (height+80+30+15+8+summaryHeight+45+8+130+30):(scoreView.frame.maxY+80+30+15+8+summaryHeight+45+8+130+30)
    }
    
}

extension UIView {
    // MARK:- 获取字符串的CGSize
    func getSize(with fontSize: CGFloat, textWidth: CGFloat , contentStr: NSString) -> CGSize {
        let str = contentStr
        let size = CGSize(width: textWidth, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], context: nil).size
    }
}


