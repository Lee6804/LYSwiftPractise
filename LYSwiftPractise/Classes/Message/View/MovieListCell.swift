//
//  MovieListCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/9.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit
import SnapKit

class MovieListCell: UITableViewCell {
    
    fileprivate lazy var iconImg: UIImageView = { [unowned self] in
        let vImg:UIImageView = UIImageView()
        vImg.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(vImg)
        return vImg
        }()
    
    fileprivate lazy var movieTitleLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 15)
        vLabel.numberOfLines = 0
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var ratingLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.boldSystemFont(ofSize: 10)
        vLabel.textColor = UIColor.red
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var directorNameLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 13)
        vLabel.textColor = UIColor.darkGray
        vLabel.numberOfLines = 0
        self.contentView.addSubview(vLabel)
        return vLabel
        }()
    
    fileprivate lazy var actorNameLabel: UILabel = { [unowned self] in
        let vLabel:UILabel = UILabel()
        vLabel.font = UIFont.systemFont(ofSize: 13)
        vLabel.textColor = UIColor.darkGray
        vLabel.numberOfLines = 0
        self.contentView.addSubview(vLabel)
        return vLabel
        }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.backgroundColor = UIColor.white
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        
        self.iconImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(15)
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(110)
        }
        self.iconImg.layer.cornerRadius = 5
        self.iconImg.layer.masksToBounds = true
        
        self.movieTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImg.snp.top)
            make.left.equalTo(self.iconImg.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.height.lessThanOrEqualTo(40)
        }
        
        self.ratingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.movieTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.movieTitleLabel.snp.left)
            make.right.equalTo(self.movieTitleLabel.snp.right)
            make.height.lessThanOrEqualTo(20)
        }
        
        self.directorNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ratingLabel.snp.bottom).offset(8)
            make.left.equalTo(self.movieTitleLabel.snp.left)
            make.right.equalTo(self.movieTitleLabel.snp.right)
            make.height.lessThanOrEqualTo(35)
        }
        
        self.actorNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.directorNameLabel.snp.bottom).offset(8)
            make.left.equalTo(self.movieTitleLabel.snp.left)
            make.right.equalTo(self.movieTitleLabel.snp.right)
            make.height.lessThanOrEqualTo(35)
        }
    }
}

extension MovieListCell {
    
    func refreshUIWithModel(model:DBMovieTopListModel){

        let url = URL(string: model.images!["large"] as! String)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            if error != nil{
                print(error.debugDescription)
            }else{
                
                let img = UIImage(data:data!)
                //回主线程刷新UI
                DispatchQueue.main.async {
                  self.iconImg.image = img
                }
            }
        }) as URLSessionTask
        
        dataTask.resume()
        
        let titleStr = model.title! as String
        let yearStr = "(\(model.year! as String))"
        
        self.movieTitleLabel.text = titleStr + yearStr
        self.movieTitleLabel.attributedText = changeTextColor(text: titleStr + yearStr, color: UIColor.lightGray, range: NSRange(location: titleStr.count, length: yearStr.count))
        
        let ratingDic = model.rating
        let rating = ratingDic!["average"]
        
        self.ratingLabel.text = "评分: \(rating as! CGFloat) "
        
        let directorArr = model.directors
        let directorNameArr:NSMutableArray = NSMutableArray()
        for i in 0..<directorArr!.count {
            let dic = directorArr![i] as! NSDictionary
            directorNameArr.add(dic["name"] as! String)
        }
        self.directorNameLabel.text = "导演: \(directorNameArr.componentsJoined(by: " / "))"
        
        let castsArr = model.casts
        let castsNameArr:NSMutableArray = NSMutableArray()
        for i in 0..<castsArr!.count {
            let dic = castsArr![i] as! NSDictionary
            castsNameArr.add(dic["name"] as! String)
        }
        self.actorNameLabel.text = "主演: \(castsNameArr.componentsJoined(by: " / "))"
    }
}

func changeTextColor(text: String, color: UIColor, range: NSRange) -> NSAttributedString {
    let attributeStr = NSMutableAttributedString(string: text)
    attributeStr.addAttribute(NSForegroundColorAttributeName, value:color , range: range)
    
    return attributeStr
}
