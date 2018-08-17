//
//  MovieActorInfoVC.swift
//  LYSwiftPractise
//
//  Created by Lee on 2018/8/14.
//  Copyright © 2018年 Lee. All rights reserved.
//

import UIKit

typealias funcBlock = () -> ()

class MovieActorInfoVC: BaseViewController {
    
    var popToView : funcBlock?
    
    var isWillAppear = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.isWillAppear = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.isWillAppear = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func callBackBlock(block:@escaping () -> ()) {
         popToView = block
    }
    
    override func leftItemTouch() {
        
        guard self.navigationController != nil else { return }
        
        popToView!()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        popToView!()
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
