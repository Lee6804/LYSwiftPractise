//
//  MainVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5)
        
        let colV = UICollectionView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight), collectionViewLayout: layout)
        colV.delegate = self
        colV.dataSource = self
        colV.backgroundColor = BACKGROUNGCOLOR
        colV.register(MainListCollectionViewCell.self, forCellWithReuseIdentifier: "MAINLISTCELL")
        return colV
    }()
    
    var arr: [NSObject] = [NSObject]()
    let dic1 = ["iconImg":"1.jpg","headImg":"headImg.jpg","name":"天王盖地虎","title":"世界本无路,走的人多了,也就成了路"]
    let dic2 = ["iconImg":"2.jpg","headImg":"headImg.jpg","name":"宝塔镇河妖","title":"阿西吧"]
    let dic3 = ["iconImg":"3.jpg","headImg":"headImg.jpg","name":"阿枫","title":"在下良辰,请给个面子"]
    let dic4 = ["iconImg":"4.jpg","headImg":"headImg.jpg","name":"流川枫","title":"无聊透顶,哎"]
    let dic5 = ["iconImg":"2.jpg","headImg":"headImg.jpg","name":"樱木","title":"来来来,喝完一杯再来三杯"]
    let dic6 = ["iconImg":"3.jpg","headImg":"headImg.jpg","name":"绝","title":"绝地反击"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = MAINCOLOR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        arr.append(dic1 as NSObject)
        arr.append(dic2 as NSObject)
        arr.append(dic3 as NSObject)
        arr.append(dic4 as NSObject)
        arr.append(dic5 as NSObject)
        arr.append(dic6 as NSObject)
        
        self.view.addSubview(self.collectionView)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (MainWidth-15)/2, height: (MainWidth-15)/2 + 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MAINLISTCELL", for: indexPath) as! MainListCollectionViewCell
        cell.refreshUI(info: arr[indexPath.item] as! NSDictionary)
        return cell
    }
}

