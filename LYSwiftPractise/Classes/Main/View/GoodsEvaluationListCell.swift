//
//  GoodsEvaluationListCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/15.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsEvaluationListCell: UITableViewCell {
    
    fileprivate lazy var headImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.contentMode = UIViewContentMode.scaleAspectFill
        nImg.image = UIImage(named: "headImg.jpg")
        self.contentView.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var nameLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "无聊的人生"
        nLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var timeLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "10分钟前"
        nLabel.font = UIFont.systemFont(ofSize: 13)
        nLabel.textColor = UIColor.lightGray
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var evalLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "小米8手机运行流畅，屏幕清晰，电池容纳高强度使用。正面拍摄美颜效果极佳，随机附赠送透明手机壳，最赞的是系统更新覆盖所有机型，一路走来，不断更新的系统才是王道，支持红外万能遥控，秒杀某果、末族、某为、OP某O、V某VO，一直支持小米。。。极赞 "
        nLabel.font = UIFont.systemFont(ofSize: 15)
        nLabel.textColor = UIColor.darkGray
        nLabel.numberOfLines = 0
        self.contentView.addSubview(nLabel)
        return nLabel
        }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        self.headImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.width.height.equalTo(44)
        }
        self.headImg.layer.cornerRadius = 22
        self.headImg.layer.masksToBounds = true
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headImg.snp.top).offset(2)
            make.left.equalTo(self.headImg.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(3)
            make.left.equalTo(self.nameLabel)
            make.height.equalTo(20)
        }
        
        self.evalLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headImg.snp.bottom).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.height.equalTo(120)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
