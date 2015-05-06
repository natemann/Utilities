//
//  ImagePicker.swift
//  TotalPlantAssessment
//
//  Created by Nathan Mann on 5/6/15.
//  Copyright (c) 2015 Nathan Mann. All rights reserved.
//

import Foundation

class ImagePicker: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var delegate: AnyObject? {
        willSet {
        
        }
    }
    
    func showAlert() {
        if let delegate = delegate as? UIViewController {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alert.addAction(cancelButton)
            
            let cameraButton = UIAlertAction(title: "Take Picture", style: .Default) { action in
                
            }
            alert.addAction(cameraButton)
            
            let imagePickerButton = UIAlertAction(title: "Select Image", style: .Default) { action in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate      = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType    = .PhotoLibrary
                
                delegate.presentViewController(imagePicker, animated: true, completion: nil)
            }
            alert.addAction(imagePickerButton)
            
            
            delegate.presentViewController(alert, animated: true, completion: nil)
        }
    }

}