//
//  BlankImageView.swift
//  TotalPlantAssessment
//
//  Created by Nathan Mann on 5/6/15.
//  Copyright (c) 2015 Nathan Mann. All rights reserved.
//

import Foundation

class BlankImageView: UIImageView {
    
//    Initializers
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        userInteractionEnabled = true
        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.borderWidth = 1.0
        let button = UIButton(frame: self.frame)
        button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        addSubview(button)
    }
    
//    Variables
    
    public var selectedImage: () -> () = { }
    
    
//    MARK: instance Methods
    func buttonPressed(sender: UIButton) {
        selectedImage()
    }
    
}