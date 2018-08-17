//
//  GoodsDetailHeadView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/15.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsDetailHeadView: UIView {

    fileprivate lazy var cycleScrollView:SDCycleScrollView = { [unowned self] in
        let nView:SDCycleScrollView = SDCycleScrollView()
        nView.currentPageDotColor = MAINCOLOR
        nView.backgroundColor = UIColor.white
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var nameLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nLabel.text = "小米8"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var intrLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 15)
        nLabel.textColor = UIColor.darkGray
        nLabel.numberOfLines = 0
        nLabel.text = "「重磅旗舰在售中」全球首款双频GPS / 骁龙845处理器 / 红外人脸解锁 / AI变焦双摄 / 三星 AMOLED 屏"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var priceLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.boldSystemFont(ofSize: 23)
        nLabel.textColor = UIColor.red
        nLabel.text = "¥ 2999.00"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var grayView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = BACKGROUNGCOLOR
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var chooseTitleLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 15)
        nLabel.textColor = UIColor.darkGray
        nLabel.text = "已选"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var arrowImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.contentMode = UIViewContentMode.center
        nImg.image = UIImage(named: "箭头")
        self.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var chooseBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        nBtn.setTitle("64G 黑色", for: UIControlState.normal)
        self.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var grayView1:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = BACKGROUNGCOLOR
        self.addSubview(nView)
        return nView
        }()

    fileprivate lazy var evaluationTitleLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 15)
        nLabel.textColor = UIColor.darkGray
        nLabel.text = "用户评价(1548)"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var arrowImg1:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
        nImg.contentMode = UIViewContentMode.center
        nImg.image = UIImage(named: "箭头")
        self.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var evaluationLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.font = UIFont.systemFont(ofSize: 15)
        nLabel.textColor = UIColor.black
        nLabel.text = "99.8%满意"
        self.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var lineView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = BACKGROUNGCOLOR
        self.addSubview(nView)
        return nView
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        self.backgroundColor = UIColor.white
        
        self.cycleScrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.width.height.equalTo(MainWidth)
        }
        
        self.cycleScrollView.imageURLStringsGroup = ["https://imgservice.suning.cn/uimg1/b2c/image/H8ilWh953peB51wZThgiJQ==.jpg_800w_800h_4e","https://imgservice.suning.cn/uimg1/b2c/image/H8ilWh953peB51wZThgiJQ==.jpg_800w_800h_4e","https://imgservice.suning.cn/uimg1/b2c/image/-W29Pzwgo3RjAwtiS7MN7Q==.jpg_800w_800h_4e","https://imgservice.suning.cn/uimg1/b2c/image/v7lz0dnGpML5SdUnVsYexQ==.jpg_800w_800h_4e"]
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.cycleScrollView.snp.bottom).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.height.equalTo(20)
        }
        
        self.intrLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self.nameLabel)
            make.height.equalTo(40)
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.intrLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self.nameLabel)
            make.height.equalTo(20)
        }
        
        self.grayView.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        
        self.chooseTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView.snp.bottom).offset(15)
            make.left.equalTo(self.nameLabel)
            make.height.equalTo(20)
        }
        
        self.arrowImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.chooseTitleLabel)
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.height.equalTo(20)
        }
        
        self.chooseBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView.snp.bottom).offset(15)
            make.left.equalTo(self.chooseTitleLabel.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.grayView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.chooseBtn.snp.bottom).offset(15)
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        
        self.evaluationTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView1.snp.bottom).offset(15)
            make.left.equalTo(self.nameLabel)
            make.height.equalTo(20)
        }
        
        self.arrowImg1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.evaluationTitleLabel)
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.height.equalTo(20)
        }
        
        self.evaluationLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.evaluationTitleLabel)
            make.right.equalTo(self.arrowImg1.snp.left).offset(-3)
            make.height.equalTo(20)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.evaluationLabel.snp.bottom).offset(14)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
}
