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
    var infoDic:NSDictionary = NSDictionary()
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
            let sectionModel = self.dataArr[indexPath.section] as! TypeSectionModel
            (reusableview as! GoodsTypeCollectionReusableHeaderView).titleLabel.text = (sectionModel.kind! as String)
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
        let sectionModel = self.dataArr[section] as! TypeSectionModel
        return sectionModel.data!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = GoodsTypeCollectionViewCell()
        let sectionModel = self.dataArr[indexPath.section] as! TypeSectionModel
        let model = sectionModel.data![indexPath.row] as! TypeModel
        return CGSize.init(width: cell.colCellWidth(model:model), height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TYPECELL", for: indexPath) as! GoodsTypeCollectionViewCell
        let sectionModel = self.dataArr[indexPath.section] as! TypeSectionModel
        let model = sectionModel.data![indexPath.row] as! TypeModel
        cell.refreshUI(model: model, indexPath: indexPath as NSIndexPath, dataArr: self.dataArr)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension ChooseGoodsTypeView:GoodsTypeCollectionViewCellDelegate {
    
    func reloadCol() {
        //kindTitleArr用于存放 类型名称 如果全部分类都已经选择了一个则数组位空 显示的就是 已选某些种类
        //kindArr用于存放已选的种类 如果kindArr的count和self.dataArr的count相等 则表示所有分类类型都已经选择了 然后再去根据原始的skus数据进行对比 将相应的信息刷新
        let kindTitleArr:NSMutableArray = NSMutableArray()
        let kindArr:NSMutableArray = NSMutableArray()
        for i in 0..<self.dataArr.count {
            
            let sectionModel = self.dataArr[i] as? TypeSectionModel
            var allSelected = false
            sectionModel?.data?.enumerateObjects({ (model, index, stop) in
                let model = model as? TypeModel
                if model?.isSelected == true {
                    allSelected = true
                    kindArr.add(model?.name as Any)
                }
            })
            if allSelected == false {
                kindTitleArr.add(sectionModel?.kind as Any)
            }
        }
        
        if kindTitleArr.count != 0 {
            self.choosedLabel.text = "请选择 \(kindTitleArr.componentsJoined(by: " "))"
            
            //勾选后取消任意一个都需要将数据还原
            self.updataView(dic: self.infoDic)
            
        }else{
            self.choosedLabel.text = "已选: \(kindArr.componentsJoined(by: " "))"
        }
        
//        print(message: kindArr)
        
        //排除不可选分类类型
        if kindArr.count != 0 && kindArr.count != self.dataArr.count {
            
            let noExitArr:NSMutableArray = NSMutableArray()
            
            for m in 0..<kindArr.count{
                let skuArr = infoDic["skus"] as? NSArray
                for i in 0..<skuArr!.count {
                    let skuDetailDic = skuArr![i] as? NSDictionary
                    let attriArr = skuDetailDic!["attributes"] as? NSArray
                    for j in 0..<attriArr!.count{
                        let dict = attriArr![j] as? NSDictionary
                        if kindArr[m] as? String == dict!["value"] as? String {
                        
//                            let dict1 = attriArr![j+1] as? NSDictionary
                            print(message: dict!["value"])
                        }
                    }
                }
            }
        }
        
        
        if kindArr.count == self.dataArr.count {
            
            let skuArr = infoDic["skus"] as? NSArray
            for i in 0..<skuArr!.count {
                let checkReloadArr:NSMutableArray = NSMutableArray()
                let skuDetailDic = skuArr![i] as? NSDictionary
                let attriArr = skuDetailDic!["attributes"] as? NSArray
                for j in 0..<attriArr!.count{
                    let dict = attriArr![j] as? NSDictionary
                    let str = dict!["value"] as! String
                    checkReloadArr.add(str)
                }
//                print(message: checkReloadArr)
                //如果勾选的和遍历出来的arr是相等的 则将此sku的信息刷新到界面上
                if kindArr == checkReloadArr {
                    
                    //更新数据
                    self.updataView(dic: skuDetailDic!)

                }
            }
        }
        self.collectionView.reloadData()
    }
}

//MARK:loadData
extension ChooseGoodsTypeView {
    
    func refreshUI(infoDic:NSDictionary) {
//        print(message: infoDic["skus"])
        
        self.infoDic = infoDic
        
        dataArr.removeAllObjects()
        
        //更新数据
        self.updataView(dic: infoDic)
        
        let arr1:NSMutableArray = NSMutableArray()
        
        let skuArr = infoDic["skus"] as? NSArray
        
        for i in 0..<skuArr!.count {
            let skuDetailDic = skuArr![i] as? NSDictionary
            let attriArr = skuDetailDic!["attributes"] as? NSArray
            for j in 0..<attriArr!.count{
                let dict = attriArr![j] as? NSDictionary
                let mutDic:NSMutableDictionary = NSMutableDictionary()
                mutDic.setObject(dict!["key"] as Any, forKey: "kind" as NSCopying)
                if arr1.contains(mutDic) == false {
                    arr1.add(mutDic)
                }
            }
        }
        
//        print(message: arr1)
        
        let copArr1 = arr1.mutableCopy() as? NSMutableArray
        for i in 0..<copArr1!.count {
            let nDic = copArr1![i] as? NSMutableDictionary
            let nArr:NSMutableArray = NSMutableArray()
            for i in 0..<skuArr!.count {
                let skuDetailDic = skuArr![i] as? NSDictionary
                let attriArr = skuDetailDic!["attributes"] as? NSArray
                for j in 0..<attriArr!.count{
                    let dict = attriArr![j] as? NSDictionary
                    let addDic:NSMutableDictionary = NSMutableDictionary()
                    if dict!["key"] as? String == nDic!["kind"] as? String{
                        addDic.setObject(dict!["value"] as Any, forKey: "name" as NSCopying)
                        addDic.setObject(false, forKey: "isSelected" as NSCopying)
                        if nArr.contains(addDic as Any) == false {
                            nArr.add(addDic)
                        }
                    }
                }
            }
            nDic?.setObject(nArr, forKey: "kindValue" as NSCopying)
            if arr1.contains(nDic as Any) == false {
                arr1.add(nDic as Any)
            }
        }
//        print(message: arr1)
        
        for i in 0..<arr1.count {
            let dic = arr1[i] as! NSDictionary
            let sectionModel = TypeSectionModel.init(dic: dic)
            self.dataArr.add(sectionModel)
        }
        
        let kindArr:NSMutableArray = NSMutableArray()
        for i in 0..<dataArr.count {
            let sectionModel = dataArr[i] as! TypeSectionModel
            kindArr.add(sectionModel.kind as Any)
        }
        
        self.choosedLabel.text = "请选择 \(kindArr.componentsJoined(by: " "))"
        
        self.collectionView.reloadData()
    }
    
    //更新界面数据
    func updataView(dic:NSDictionary) {
        
        self.stockNum = NSInteger((dic["stockQuantity"] as? NSNumber)!)
        self.goodsImg.sd_setImage(with: NSURL(string: (dic["mainImage"] as? String)!)! as URL, placeholderImage: UIImage(named: "nopic.jpg"))
        let price = dic["sellingPrice"] as? Float64
        let priceStr = String(format: "¥%.2f", price!)
        self.priceLabel.text = priceStr
    }
}


