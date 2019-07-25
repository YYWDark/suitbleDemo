//
//  File.swift
//  FaceAlorithmTest
//
//  Created by wyy on 2019/7/25.
//  Copyright © 2019 dp. All rights reserved.
//

import Foundation
import UIKit
protocol VSliderDelegate: class {
    func onSliderValueChanged(_ sender: UISlider)
}

class VSlider: UIView {
    weak public var delegate: VSliderDelegate?
    lazy var lable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 10.0)
        return lable
    }()
    
    lazy public var slider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    var title = ""
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        self.addSubview(slider)
        self.addSubview(lable)
        lable.text = title + ":" + String(0.0)
        slider.addTarget(self, action: #selector(onSlider(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        slider.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2.0)
        lable.frame = CGRect.init(x: 0, y: slider.frame.maxY, width: self.frame.width, height: self.frame.height/2.0)
    }
    
    @objc func onSlider(_ sender: UISlider) {
        lable.text = self.title + ":" + String(sender.value)
        delegate?.onSliderValueChanged(slider)
    }
    
    func value() -> Float {
        return slider.value
    }
}
