//
//  GoodsDetailFooterView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/15.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class GoodsDetailFooterView: UIView {
    
    var detailImgArr = ["https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/5a158dde6d83c8e6e712d662b287b935.jpg?w=1080&h=1794","https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/135d15548ed954a1504643fe02f0834a.jpg?w=1080&h=2206","https://cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/b87c4f94f33509a5888206b63f9610a8.jpg?w=1080&h=1611"]
    
    fileprivate lazy var grayView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = BACKGROUNGCOLOR
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var lineView:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor.init(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1)
        self.addSubview(nView)
        return nView
        }()
    
    fileprivate lazy var detailBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        nBtn.setTitle("产品详情", for: UIControlState.normal)
        nBtn.backgroundColor = UIColor.white
        self.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var parmBtn:UIButton = { [unowned self] in
        let nBtn:UIButton = UIButton()
        nBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nBtn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        nBtn.setTitle("参数", for: UIControlState.normal)
        nBtn.backgroundColor = UIColor.white
        self.addSubview(nBtn)
        return nBtn
        }()
    
    fileprivate lazy var lineView1:UIView = { [unowned self] in
        let nView:UIView = UIView()
        nView.backgroundColor = UIColor.init(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1)
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
        
        self.grayView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView.snp.bottom).offset(-1)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.detailBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView.snp.bottom).offset(0)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(MainWidth/2)
            make.height.equalTo(50)
        }
        
        self.parmBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.detailBtn)
            make.left.equalTo(self.detailBtn.snp.right)
            make.width.equalTo(MainWidth/2)
            make.height.equalTo(50)
        }
        
        self.lineView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.grayView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
        for i in 0..<detailImgArr.count {
           
            let count = CGFloat(i)
            let nImg = UIImageView(frame: CGRect(x: 0, y: 60 + (MainHeight - TopNavBarHeight - 50)*count, width: MainWidth, height: (MainHeight - TopNavBarHeight - 50)))
//            nImg.contentScaleFactor = UIScreen.main.scale
//            nImg.contentMode = UIViewContentMode.scaleAspectFit
//            nImg.autoresizingMask = UIViewAutoresizing.flexibleHeight
//            nImg.layer.masksToBounds = true
            let url = URL(string: detailImgArr[i])
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
//                        self.iconImg.image = img
                        nImg.image = img?.reSizeImage(reSize: CGSize(width: MainWidth, height: (MainHeight - TopNavBarHeight - 50)))
                    }
                }
            }) as URLSessionTask
            
            dataTask.resume()
            
            
            self.addSubview(nImg)
        }
    }
    
}


extension UIImage {
    
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
//        self.draw(CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
}

