//
//  InsetTextField.swift
//  TotalPlantAssessment
//
//  Created by Nathan Mann on 3/31/15.
//  Copyright (c) 2015 Nathan Mann. All rights reserved.
//

import Foundation

class InsetTextField: UITextField {
    
    //    MARK: Constants
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.backgroundColor   = .whiteColor()
        self.textInset         = (10, 10)
        self.editInset         = (10, 10)
    }
    
    var textInset: (dx: CGFloat, dy: CGFloat) = (0,0)
    var editInset: (dx: CGFloat, dy: CGFloat) = (0,0)
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, textInset.dx, textInset.dy)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, editInset.dx, editInset.dy)
    }
}