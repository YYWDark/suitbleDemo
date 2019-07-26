//
//  V2ViewController.swift
//  FaceAlorithmTest
//
//  Created by wyy on 2019/7/25.
//  Copyright © 2019 dp. All rights reserved.
//

import Foundation
import UIKit
class V2ViewController: UIViewController {
    
    let label1 = UILabel()
    let label2 = UILabel()
    
    let slider1 = UISlider()
    let slider2 = UISlider()
    
    
    let button = UIButton()
    
    
    let label3 = UILabel()
    let eyeSlider = UISlider()
    let noseSlider = UISlider()
    
    var male = true
    
    let al = Alorithm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
//        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
//        self.navigationController?.navigationBar.isHidden = false
        
        
        view.addSubview(button)
        button.backgroundColor = .gray
        button.frame = CGRect(x: 20, y: 600, width: 140, height: 40)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(onGender), for: .touchUpInside)
        updateTitle()
        
        
        var rt = CGRect(x: 20, y: 200, width: view.frame.width-40, height: 40)
        let l1 = UILabel()
        l1.textColor = .gray
        l1.text = "facelong"
        view.addSubview(l1)
        l1.frame = rt
        
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 40)
        slider1.frame = rt
        slider1.minimumValue = 0
        slider1.maximumValue = 1
        view.addSubview(slider1)
        slider1.addTarget(self, action: #selector(onSlider1(_:)), for: .valueChanged)
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 60)
        
        let l2 = UILabel()
        l2.textColor = .gray
        l2.text = "facewidth"
        view.addSubview(l2)
        l2.frame = rt
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 40)
        slider2.frame = rt
        slider2.minimumValue = 0
        slider2.maximumValue = 1
        view.addSubview(slider2)
        slider2.addTarget(self, action: #selector(onSlider2(_:)), for: .valueChanged)
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 60)
        
        let l3 = UILabel()
        l3.textColor = .gray
        l3.text = "eye 只跟性别有关"
        view.addSubview(l3)
        l3.frame = rt
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 40)
        eyeSlider.frame = rt
        eyeSlider.minimumValue = 0
        eyeSlider.maximumValue = 1
        view.addSubview(eyeSlider)
        eyeSlider.addTarget(self, action: #selector(onSlider2(_:)), for: .valueChanged)
        
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 60)
        
        let l4 = UILabel()
        l4.textColor = .gray
        l4.text = "nose 只跟性别有关"
        view.addSubview(l4)
        l4.frame = rt
        
        rt.origin = CGPoint(x: rt.origin.x, y: rt.origin.y + 40)
        noseSlider.frame = rt
        noseSlider.minimumValue = 0
        noseSlider.maximumValue = 1
        view.addSubview(noseSlider)
        noseSlider.addTarget(self, action: #selector(onSlider2(_:)), for: .valueChanged)
        
        view.addSubview(label1)
        label1.textColor = .black
        label1.numberOfLines = 2
        label1.frame = CGRect(x: 20, y: 650, width: view.frame.width, height: 50)
        
        view.addSubview(label2)
        label2.textColor = .black
        label2.numberOfLines = 2
        label2.frame = CGRect(x: 20, y: 70, width: view.frame.width, height: 50)
        
        view.addSubview(label2)
        label2.textColor = .black
        label2.numberOfLines = 2
        label2.frame = CGRect(x: 20, y: 120, width: view.frame.width, height: 50)
        
        
        view.addSubview(label3)
        label3.textColor = .black
        label3.numberOfLines = 2
        label3.frame = CGRect(x: 20, y: 170, width: view.frame.width, height: 50)
        
        outputResult()
    }
    
    func updateTitle() {
        let title = male ? "当前是男生" : "当前是女生"
        button.setTitle(title, for: .normal)
    }
    
    @objc func onGender() {
        male = !male
        updateTitle()
        outputResult()
    }
    
    @objc func onSlider1(_ sender:UISlider) {
        outputResult()
    }
    
    
    @objc func onSlider2(_ sender:UISlider) {
        outputResult()
    }
    
    func outputResult() {
        let faceLong = slider1.value
        let faceWidth = slider2.value
        let eye = eyeSlider.value
        let nose = noseSlider.value
        label1.text = "faceLong:\(faceLong) faceWidth:\(faceWidth) \n eye:\(eye) nose:\(nose)"
        let smallFace = al.smallFaceOpt(faceLong, faceWidth: faceWidth, isMale: male)
        let cutFace = al.cutFaceOpt(faceLong, faceWidth: faceWidth, isMale: male)
        let cheek = al.cheekBoneOpt(faceLong, faceWidth: faceWidth, isMale: male)
        let lower = al.lowerJawOpt(faceLong, faceWidth: faceWidth, isMale: male)
        
        label2.text = "小脸：\(smallFace), 窄脸：\(cutFace)，\n 颧骨：\(cheek), 下颚骨：\(lower)"
        
        
        let eyeV = al.bigEyesDefaultValue(eye, isMale: male)
        let noseV = al.thinNoseDefaultValue(nose, isMale: male)
        label3.text = "小眼：\(eyeV), 瘦鼻：\(noseV)"
    }
    
}

extension ViewController {
    
}
