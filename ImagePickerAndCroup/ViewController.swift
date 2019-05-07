//
//  ViewController.swift
//  ImagePickerAndCroup
//
//  Created by Shalika Lahiru on 5/7/19.
//  Copyright © 2019 Shalika Lahiru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Clickedcapture(_ sender: Any) {
        let imagerPickerController = UIImagePickerController()
        imagerPickerController.delegate = self
        imagerPickerController.allowsEditing = true       //open action bar
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagerPickerController.sourceType = .camera
                self.present(imagerPickerController, animated: true, completion: nil)
            }
            else{
                print("camera not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (UIAlertAction) in
            imagerPickerController.sourceType = .photoLibrary
            self.present(imagerPickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var image : UIImage!

        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            image = img
            
        }
        else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            image = img
        }
        
        imageView.image = image
        picker.dismiss(animated: true,completion: nil)
    }
    
    
}

