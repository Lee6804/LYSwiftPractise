//
//  BaseTabBarViewController.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/7.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    fileprivate lazy var backView: UIView = { [unowned self] in
        let bView: UIView = UIView();
        bView.backgroundColor = UIColor.white
        return bView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.backView.frame = CGRect(x: 0, y: 0, width: MainWidth, height: 49)
        self.tabBar.addSubview(self.backView)
        
        let mainVC = MainVC()
        self.addChildViewController(childVC: mainVC, title: "首页", norImgStr: "b_menuMain_unselect", seleImgStr: "b_menuMain_select")
        
        let messageVC = MessageVC()
        self.addChildViewController(childVC: messageVC, title: "影讯", norImgStr: "b_menuBar_unselect", seleImgStr: "b_menuBar_select")
        
        let mineVC = MineVC()
        self.addChildViewController(childVC: mineVC, title: "我的", norImgStr: "b_menuMine_unselect", seleImgStr: "b_menuMine_select")
        
        self.tabBarItem.setTitleTextAttributes(NSDictionary(object: UIColor.darkGray, forKey: NSForegroundColorAttributeName as NSCopying) as? [String: AnyObject], for: UIControlState.normal)
        self.tabBarItem.setTitleTextAttributes(NSDictionary(object: MAINCOLOR, forKey: NSForegroundColorAttributeName as NSCopying) as? [String: AnyObject], for: UIControlState.selected)
    }
    
    
    func addChildViewController(childVC: UIViewController,title: String,norImgStr: String,seleImgStr: String) {
        
        self.tabBarItem.title = title
        self.tabBar.tintColor = MAINCOLOR
        
        childVC.title = title as String
        
        var norImg = UIImage(named: norImgStr)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var seleImg = UIImage(named: seleImgStr)
        seleImg = seleImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let navVC = BaseNavigationController(rootViewController: childVC)
        navVC.tabBarItem = UITabBarItem(title: title, image: norImg, selectedImage: seleImg)
        
        self.addChildViewController(navVC)
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
