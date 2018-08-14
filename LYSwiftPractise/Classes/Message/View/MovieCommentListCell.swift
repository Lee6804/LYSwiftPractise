//
//  MovieCommentListCell.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

//@objc protocol commentSupportDelegate:NSObjectProtocol {
//
//    @objc optional func commentSupport(btnTag:NSInteger)
//}

class MovieCommentListCell: UITableViewCell {

    var infoModel = MovieDetailCommentsModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate lazy var headImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.image = UIImage(named: "headImg.jpg")
        nImg.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var nameLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 13)
        nLabel.text = "陌上花开"
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var starLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 13)
        nLabel.text = "★★★★★"
        nLabel.textColor = UIColor.orange
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var supportBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("1542", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        nBtn.setImage(UIImage(named: "点赞"), for: UIControlState.normal)
        nBtn.setImage(UIImage(named: "点赞Sele"), for: UIControlState.selected)
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        nBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        nBtn.addTarget(self, action: #selector(supportBtnClick(sender:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var contentLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 13)
        nLabel.numberOfLines = 0
        self.contentView.addSubview(nLabel)
        return nLabel
        }()
    
//    weak var delegate:commentSupportDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func supportBtnClick(sender:UIButton) {
//        self.delegate?.commentSupport?(btnTag: sender.tag)

        sender.isSelected = !sender.isSelected
        infoModel.isSupport = sender.isSelected
        
        if sender.isSelected == true {
            let count = ((infoModel.supportCount)?.integerValue)! + 1
            sender.setTitle("\(count)", for: UIControlState.normal)
        }else{
            let count = ((sender.titleLabel?.text as NSString?)?.integerValue)! - 1
            sender.setTitle("\(count)", for: UIControlState.normal)
        }
    }
    
    func setupUI() {
        
        self.headImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.width.height.equalTo(26)
        }
        self.headImg.layer.cornerRadius = 13
        self.headImg.layer.masksToBounds = true
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.left.equalTo(self.headImg.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.starLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.left.equalTo(self.nameLabel.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.supportBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.headImg)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.height.equalTo(20)
        }
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.headImg.snp.bottom).offset(10)
            make.left.equalTo(self.nameLabel)
            make.right.equalTo(self.supportBtn)
            make.height.greaterThanOrEqualTo(20)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MovieCommentListCell {
    
    func cellHeight(contentStr:NSString) -> CGFloat {
        let height = getSize(with: 13, textWidth: MainWidth - 76, contentStr: contentStr).height+1
        return (height+10+26+10+10)
    }
    
    func refreshUI(model:MovieDetailCommentsModel) {
        infoModel = model
        self.headImg.image = UIImage(named: model.headImg! as String)
        self.nameLabel.text = model.name! as String
        self.supportBtn.setTitle(model.supportCount! as String, for: UIControlState.normal)
        self.contentLabel.text = model.content! as String
        self.supportBtn.isSelected = model.isSupport!
    }
}
