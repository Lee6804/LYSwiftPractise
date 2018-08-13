//
//  MovieActorsView.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/13.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MovieActorsView: UIView {
    
    var imageArr:NSMutableArray = NSMutableArray()
    var nameArr:NSMutableArray = NSMutableArray()
    
    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let colV = UICollectionView(frame: CGRect(x: 0, y: 0, width: MainWidth, height:130), collectionViewLayout: layout)
        colV.delegate = self
        colV.dataSource = self
        colV.backgroundColor = UIColor.clear
        colV.alwaysBounceHorizontal = true;
        colV.showsHorizontalScrollIndicator = false;
        colV.register(MovieActorsCollectionViewCell.self, forCellWithReuseIdentifier: "MOVIEACTORSLISTCELL")
        return colV
        }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieActorsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 80, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MOVIEACTORSLISTCELL", for: indexPath) as! MovieActorsCollectionViewCell
        cell.refreshUI(actorImgStr: imageArr[indexPath.row] as! NSString, actorNameStr: nameArr[indexPath.row] as! NSString)
        return cell
    }
}

extension MovieActorsView {
    
    func refreshUI(directorsArr:NSArray, actorsArr:NSArray) {
        
        imageArr = NSMutableArray()
        nameArr = NSMutableArray()

        for i in 0..<directorsArr.count {
            let dic = directorsArr[i] as! NSDictionary
            nameArr.add(dic["name"] as! String)
            let imgDic = dic["avatars"] as! NSDictionary
            imageArr.add(imgDic["large"] as! String)
        }
        
        for i in 0..<actorsArr.count {
            let dic = actorsArr[i] as! NSDictionary
            nameArr.add(dic["name"] as! String)
            let imgDic = dic["avatars"] as! NSDictionary
            imageArr.add(imgDic["large"] as! String)
        }
        
        self.collectionView.reloadData()
    }
}
