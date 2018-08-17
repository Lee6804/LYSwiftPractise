//
//  ChooseGoodsTypeView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/15.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class ChooseGoodsTypeView: UIView {
    
    //MARK: var
    var stockNum:NSInteger = NSInteger()
    var dataArr:NSMutableArray = NSMutableArray()
    
    //MARK:lazy
    fileprivate lazy var typeWindow:UIWindow = { [unowned self] in
        let nWindow:UIWindow = UIWindow()
        return nWindow
        }()
    
    fileprivate lazy var typeBackView:UIView = { [unowned self] in
        let nView:UIView = UIView(frame: CGRect(x: 0, y: MainHeight + 20, width: MainWidth, height: 450))
        nView.backgroundColor = UIColor.white
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var goodsImg:UIImageView = { [unowned self] in
        let nImg:UIImageView = UIImageView()
//        nImg.sd_setImage(with: NSURL(string: "https://i8.mifile.cn/a1/pms_1527735172.84998896!560x560.jpg")! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        self.typeBackView.addSubview(nImg)
        return nImg
        }()
    
    fileprivate lazy var closeBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setImage(UIImage(named: "退出"), for: UIControlState.normal)
        nBtn.addTarget(self, action: #selector(closeBtnClick), for: UIControlEvents.touchUpInside)
        self.typeBackView.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var priceLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "¥ 2999.00"
        nLabel.textColor = UIColor.red
        nLabel.font = UIFont.systemFont(ofSize: 25)
        self.typeBackView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var countLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
        nLabel.text = "/件"
        nLabel.textColor = UIColor.darkGray
        nLabel.font = UIFont.systemFont(ofSize: 13)
        self.typeBackView.addSubview(nLabel)
        return nLabel
        }()
    
    fileprivate lazy var choosedLabel:UILabel = { [unowned self] in
        let nLabel:UILabel = UILabel()
//        nLabel.text = "已选:6GB+64GB 全网通 黑色"
        nLabel.textColor = UIColor.darkGray
        nLabel.font = UIFont.systemFont(ofSize: 13)
        self.typeBackView.addSubview(nLabel)
        return nLabel
        }()
   
    fileprivate lazy var confirmBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.setTitle("确定", for: UIControlState.normal)
        nBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        nBtn.backgroundColor = MAINCOLOR
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.addTarget(self, action: #selector(confirmBtnClick), for: UIControlEvents.touchUpInside)
        self.typeBackView.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var collectionView:UICollectionView = { [unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        let colV:UICollectionView = UICollectionView(frame: CGRect(x: 0, y:90 , width: MainWidth, height: 300), collectionViewLayout: layout)
        colV.delegate = self
        colV.dataSource = self
        colV.backgroundColor = UIColor.white
        colV.showsVerticalScrollIndicator = false
        colV.alwaysBounceVertical = true
        colV.register(GoodsTypeCollectionViewCell.self, forCellWithReuseIdentifier: "TYPECELL")
        colV.register(GoodsTypeCollectionReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        colV.register(GoodsTypeCollectionReusableFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
        
        return colV
        }()
    
    //MARK:#selector
    @objc func closeBtnClick() {
        hiddenView()
    }
    
    @objc func confirmBtnClick() {
        hiddenView()
    }

    //MARK:init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setupUI
    private func setupUI() {
        
        self.backgroundColor = UIColor.init(white: 0.3, alpha: 0.7)
      
        self.goodsImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeBackView.snp.top).offset(-20)
            make.left.equalTo(self.typeBackView.snp.left).offset(20)
            make.width.height.equalTo(100)
        }
        self.goodsImg.layer.cornerRadius = 5
        self.goodsImg.layer.borderColor = BACKGROUNGCOLOR.cgColor
        self.goodsImg.layer.borderWidth = 0.5
        self.goodsImg.layer.masksToBounds = true
        
        self.closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeBackView.snp.top).offset(5)
            make.right.equalTo(self.typeBackView.snp.right).offset(-5)
            make.width.height.equalTo(30)
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.closeBtn.snp.bottom)
            make.left.equalTo(self.goodsImg.snp.right).offset(10)
            make.height.equalTo(20)
        }
        
        self.countLabel.snp.makeConstraints { (make) in
            make.centerY.height.equalTo(self.priceLabel)
            make.right.equalTo(self.typeBackView.snp.right).offset(-20)
            make.left.equalTo(self.priceLabel.snp.right).offset(5)
        }
        
        self.choosedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(5)
            make.left.equalTo(self.priceLabel)
            make.right.equalTo(self.typeBackView.snp.right).offset(-20)
            make.height.equalTo(20)
        }
        
        self.confirmBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.typeBackView)
            make.height.equalTo(50)
        }
   
        self.typeBackView.addSubview(self.collectionView)
        
        self.showAnimation()
    }

}

//MARK: showView && showAnimation && hiddenAnimation
extension ChooseGoodsTypeView {
    
    func showView() {

        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight))
        window.windowLevel = UIWindowLevelAlert
        window.becomeKey()
        window.makeKeyAndVisible()
        window.isHidden = false
        window.addSubview(self)
        self.typeWindow = window

        self.showAnimation()
    }
    
    func hiddenView() {
        
        UIView.animate(withDuration: 0.25, animations: {

            self.typeBackView.frame = CGRect(x: 0, y: MainHeight + 20, width: MainWidth, height: 450)
            
        }, completion: {(finished:Bool) in
            
            self.removeFromSuperview()
            self.typeWindow.resignKey()
            self.typeWindow.isHidden = true
        })
    }
    
    func showAnimation() {
    
        UIView.animate(withDuration: 0.25) {

            self.typeBackView.frame = CGRect(x: 0, y: MainHeight - 450, width: MainWidth, height: 450)
        }
    }
}

//MARK:CollectionView: delegate && dataSource
extension ChooseGoodsTypeView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview:UICollectionReusableView!
        if kind == UICollectionElementKindSectionHeader {
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! GoodsTypeCollectionReusableHeaderView
            let dic = dataArr[indexPath.section] as? NSDictionary
            (reusableview as! GoodsTypeCollectionReusableHeaderView).titleLabel.text = (dic!["kind"] as! String)
        }
        
        if kind == UICollectionElementKindSectionFooter && indexPath.section == dataArr.count - 1 {
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! GoodsTypeCollectionReusableFooterView
            (reusableview as! GoodsTypeCollectionReusableFooterView).refreshUI(stockNum: self.stockNum)
        }
        return reusableview
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: MainWidth, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        return section == dataArr.count - 1 ? CGSize(width: MainWidth, height: 70) : CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dic = dataArr[section] as? NSDictionary
        let valueArr = dic!["kindValue"] as? NSArray
        return valueArr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = GoodsTypeCollectionViewCell()
        let dic = dataArr[indexPath.section] as? NSDictionary
        let valueArr = dic!["kindValue"] as? NSArray
        let width = cell.colCellWidth(str: valueArr![indexPath.row] as! NSString)
        return CGSize.init(width: width, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TYPECELL", for: indexPath) as! GoodsTypeCollectionViewCell
        let dic = dataArr[indexPath.section] as? NSDictionary
        let valueArr = dic!["kindValue"] as? NSArray
        cell.refreshUI(str:valueArr![indexPath.row] as! NSString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

//MARK:loadData
extension ChooseGoodsTypeView {
    
    func refreshUI(infoDic:NSDictionary) {
//        print(message: infoDic["skus"])
        
        self.stockNum = NSInteger((infoDic["stockQuantity"] as? NSNumber)!)
        dataArr.removeAllObjects()
        
        self.goodsImg.sd_setImage(with: NSURL(string: (infoDic["mainImage"] as? String)!)! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        let price = infoDic["sellingPrice"] as? Float64
        let priceStr = String(format: "¥%.2f", price!)
        self.priceLabel.text = priceStr

        let skuArr = infoDic["skus"] as? NSArray
        
        for i in 0..<skuArr!.count {
            let skuDetailDic = skuArr![i] as? NSDictionary
            let attriArr = skuDetailDic!["attributes"] as? NSArray
            for j in 0..<attriArr!.count{
                let dict = attriArr![j] as? NSDictionary
                let mutDic:NSMutableDictionary = NSMutableDictionary()
                mutDic.setObject(dict!["key"] as Any, forKey: "kind" as NSCopying)
                if dataArr.contains(mutDic) == false {
                    dataArr.add(mutDic)
                }
            }
        }
        
//        print(message: dataArr)
        
        let copArr1 = dataArr.mutableCopy() as? NSMutableArray
        for i in 0..<copArr1!.count {
            let nDic = copArr1![i] as? NSMutableDictionary
            let nArr:NSMutableArray = NSMutableArray()
            for i in 0..<skuArr!.count {
                let skuDetailDic = skuArr![i] as? NSDictionary
                let attriArr = skuDetailDic!["attributes"] as? NSArray
                for j in 0..<attriArr!.count{
                    let dict = attriArr![j] as? NSDictionary
                    if dict!["key"] as? String == nDic!["kind"] as? String{
                        if nArr.contains(dict!["value"] as Any) == false {
                            nArr.add(dict!["value"] as Any)
                        }
                    }
                }
            }
            nDic?.setObject(nArr, forKey: "kindValue" as NSCopying)
            if dataArr.contains(nDic as Any) == false {
                dataArr.add(nDic as Any)
            }
        }
        print(message: dataArr)
        
        let kindArr:NSMutableArray = NSMutableArray()
        for i in 0..<dataArr.count {
            let kindDic = dataArr[i] as? NSDictionary
            kindArr.add(kindDic!["kind"] as Any)
        }
        
        self.choosedLabel.text = "请选择 \(kindArr.componentsJoined(by: " "))"
        
        self.collectionView.reloadData()
    }
}
