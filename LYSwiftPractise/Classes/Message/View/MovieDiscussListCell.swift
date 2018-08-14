//
//  MovieDiscussListCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieDiscussListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate lazy var contentLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 13)
        nLabel.numberOfLines = 0
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var headImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.image = UIImage(named: "headImg.jpg")
        nImg.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var nameLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 11)
        nLabel.text = ""
        nLabel.textColor = UIColor.lightGray
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var supportBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("982", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        nBtn.setImage(UIImage(named: "心"), for: UIControlState.normal)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        nBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        self.contentView.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var messageBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("102", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        nBtn.setImage(UIImage(named: "消息"), for: UIControlState.normal)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        nBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        self.contentView.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var timeLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 11)
        nLabel.text = "1小时前更新"
        nLabel.textColor = UIColor.lightGray
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.height.greaterThanOrEqualTo(20)
        }
        
        self.headImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentLabel)
            make.width.height.equalTo(20)
        }
        self.headImg.layer.cornerRadius = 10
        self.headImg.layer.masksToBounds = true
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.left.equalTo(self.headImg.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.supportBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.left.equalTo(self.nameLabel.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.messageBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.left.equalTo(self.supportBtn.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.height.equalTo(20)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension MovieDiscussListCell {
    
    func cellHeight(contentStr:NSString) -> CGFloat {
        let height = getSize(with: 13, textWidth: MainWidth - 40, contentStr: contentStr).height+1
        return (height+60)
    }
    
    func refreshUI(contentDic:NSDictionary) {
        self.headImg.image = UIImage(named: (contentDic["headImg"] as? String)!)
        self.nameLabel.text = contentDic["name"] as? String
        self.supportBtn.setTitle(contentDic["supportCount"] as? String, for: UIControlState.normal)
        self.contentLabel.text = contentDic["content"] as? String
        self.messageBtn.setTitle(contentDic["messageCount"] as? String, for: UIControlState.normal)
        self.timeLabel.text = contentDic["time"] as? String
    }
}
