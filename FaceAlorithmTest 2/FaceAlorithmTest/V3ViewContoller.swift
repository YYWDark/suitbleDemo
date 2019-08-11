//
//  File.swift
//  FaceAlorithmTest
//
//  Created by wyy on 2019/7/25.
//  Copyright © 2019 dp. All rights reserved.
//

import UIKit
let sliderHeight: CGFloat = 40.0

class V3Viewcontroller: UIViewController {
    lazy var containView: UIScrollView = {
        let s = UIScrollView.init(frame: self.view.bounds)
        s.contentSize = self.view.frame.size
        return s
    }()
    
    let facewidthSlider = VSlider.init(title: "facewidth")
    let facelongSlider = VSlider.init(title: "facelong")
    let faceratioSlider  = VSlider.init(title: "faceratio")
    let foreheadSlider  = VSlider.init(title: "forehead")
    let eyebrowdistSlider  = VSlider.init(title: "eyebrowdist")
    let chinSlider  = VSlider.init(title: "chin")
    let eyeSlider  = VSlider.init(title: "eye")
    let eyeshapeSlider  = VSlider.init(title: "eyeshape")
    let eyedistSlider  = VSlider.init(title: "eyedist")
    let nosewidthSlider  = VSlider.init(title: "nosewidth")
    let mouthwidthSlider  = VSlider.init(title: "mouthwidth")
//    let wrinkleSlider  = VSlider.init(title: "wrinkle")
//    let eyebagSlider  = VSlider.init(title: "eyebag")
    
    lazy var lable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0;
        lable.font = UIFont.systemFont(ofSize: 12.0)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(containView)
        let sliders: [VSlider] = [facewidthSlider,facelongSlider,faceratioSlider,foreheadSlider,eyebrowdistSlider,chinSlider,eyeSlider,eyeshapeSlider,eyedistSlider,nosewidthSlider,mouthwidthSlider]
        let top: CGFloat = 40.0
        let hor: CGFloat = 40.0
        let width = self.view.frame.width
        for (index, slider) in sliders.enumerated() {
            slider.frame = CGRect.init(x: hor, y: top+sliderHeight*CGFloat(index), width:width - hor * 2.0 , height: sliderHeight)
            print("slider is \(slider.frame)")
            slider.delegate = self
            containView.addSubview(slider)
        }
        lable.frame = CGRect.init(x: 0, y: mouthwidthSlider.frame.maxY, width: width, height: 100.0)
        containView.addSubview(lable)
        show()
    }
    
   
}

extension V3Viewcontroller: VSliderDelegate {
    func onSliderValueChanged(_ sender: UISlider) {
         show()
    }
    
    func show() {
        let al = AlorithmV3()
        let cutFaceLevel = al.cutFaceFacelong(facelongSlider.value(), facewidth: facewidthSlider.value(), eyedist: eyedistSlider.value(), chin: chinSlider.value())
        let enlargeLevel = al.bigEye(eyeSlider.value(), eyeshape: eyeshapeSlider.value(), facelong: facelongSlider.value(), eyedist: eyedistSlider.value(), facewidth: facewidthSlider.value())
        let thinNoseLevel = al.nosewidthNosewidth(nosewidthSlider.value(), faceratio: faceratioSlider.value())
        let foreheadLevel = al.foreheadForehead(foreheadSlider.value())
        let cheekBonesLevel = al.cheekBonesFacelong(facelongSlider.value(), facewidth: facewidthSlider.value(), eyedist: eyedistSlider.value(), chin: chinSlider.value())
        let lowerJawLevel = al.lowerJawFacelong(facelongSlider.value(), facewidth: facewidthSlider.value(), eyedist: eyeSlider.value(), chin: chinSlider.value())
        let eyebrowdistLevel = al.eyesmoveEyebrowdist(eyebrowdistSlider.value(), faceratio: faceratioSlider.value(), facelong: facelongSlider.value())
        let chinLevel = al.chinChin(chinSlider.value(), faceratio: faceratioSlider.value(), mouthwidth: mouthwidthSlider.value(), facelong: facelongSlider.value())
        let philtrumLevel = al.philtrumChin(chinSlider.value(), faceratio: faceratioSlider.value(), mouthwidth: mouthwidthSlider.value(), facelong: facelongSlider.value())
        let eyedistLevel = al.eyeDistacneEyedist(eyedistSlider.value(), facewidth: facewidthSlider.value())
        let noseLongLevel = al.noseFaceratio(faceratioSlider.value(), eyebrowdist: eyebrowdistSlider.value(), facelong: facelongSlider.value(), chin: chinSlider.value())
        let mouthwidthLevel = al.mouthWidthMouth(mouthwidthSlider.value())
        lable.text =  "【智能形变 窄脸:\(cutFaceLevel)  大眼:\( enlargeLevel) 瘦鼻:\( thinNoseLevel) 发际线:\( foreheadLevel) 瘦颧骨:\(cheekBonesLevel) 瘦下颌骨:\(lowerJawLevel) 眼睛上下移:\(eyebrowdistLevel) 下巴:\(chinLevel) 缩人中:\( philtrumLevel) 眼距:\(eyedistLevel) 鼻长:\(noseLongLevel) 嘴型:\(mouthwidthLevel) \n"
    }
}

