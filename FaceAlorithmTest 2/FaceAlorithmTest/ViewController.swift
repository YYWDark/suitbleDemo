//
//  ViewController.swift
//  FaceAlorithmTest
//
//  Created by 林东鹏 on 2019/3/26.
//  Copyright © 2019 dp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let v2 =  UIButton.init(type: .system)
        v2.backgroundColor = UIColor.blue
        v2.frame = CGRect.init(x: 20, y: 100, width: self.view.frame.width - 40.0, height: 100)
        v2.addTarget(self, action: #selector(gotoV2), for: .touchUpInside)
        v2.setTitle("V2算法", for: .normal)
        view.addSubview(v2)
        
        let v3 =  UIButton.init(type: .system)
        v3.backgroundColor = UIColor.green
        v3.frame = CGRect.init(x: 20, y: v2.frame.maxY + 50.0, width: self.view.frame.width - 40.0, height: 100)
        v3.addTarget(self, action: #selector(gotoV3), for: .touchUpInside)
        v3.setTitle("V3算法", for: .normal)
        view.addSubview(v3)
        
    }
    
    
    @objc func gotoV2() {
        self.navigationController?.pushViewController(V2ViewController(), animated: true)
    }
    
    @objc func gotoV3() {
        self.navigationController?.pushViewController(V3Viewcontroller(), animated: true)
    }
}
