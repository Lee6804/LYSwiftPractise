//
//  MainVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    var data:NSMutableArray = NSMutableArray()
    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsetsMake(8, 0, 8, 0)
        
        let colV = UICollectionView(frame: CGRect(x: 0, y: 0, width: MainWidth, height: MainHeight - TopNavBarHeight), collectionViewLayout: layout)
        colV.delegate = self
        colV.dataSource = self
        colV.backgroundColor = BACKGROUNGCOLOR
        colV.register(MainListCollectionViewCell.self, forCellWithReuseIdentifier: "MAINLISTCELL")
        colV.register(MainCollectionReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        return colV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = MAINCOLOR
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        self.view.addSubview(self.collectionView)
        
        loadData()
    }
    
    func loadData() {
        
        let path = Bundle.main.path(forResource:"content", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
//        print(message: jsonDic)
        
        let arr = jsonDic["goods"] as? NSArray
        for i in 0..<arr!.count {
            let dic = arr![i] as? NSDictionary
            let model = GoodsListModel.init(dic: dic!)
            self.data.add(model)
        }
        
        self.collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as? MainCollectionReusableHeaderView
            reusableView = headerView!
        }
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: MainWidth, height: MainWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (MainWidth-8)/2, height: (MainWidth-8)/2 + 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MAINLISTCELL", for: indexPath) as! MainListCollectionViewCell
        let model = self.data[indexPath.row] as? GoodsListModel
        cell.refreshUI(model: model!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = MainDetailVC()
        let model = self.data[indexPath.row] as? GoodsListModel
        detailVC.title = "\(model?.extenalFiledsModel?.paramValue ?? "")"
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

