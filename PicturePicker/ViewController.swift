//
//  ViewController.swift
//  PicturePicker
//
//  Created by Mike Huffaker on 11/29/16.
//  Copyright © 2016 Mike Huffaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var imgView: UIImageView!
    
    let pickerController = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
    }

    // User cancelled instead of picking an image
    func imagePickerControllerDidCancel( _ picker: UIImagePickerController )
    {
        dismiss( animated: true, completion: nil )
    }

    // User actually picked an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imgView.contentMode = .scaleAspectFit
            imgView.image = image
        }
        else
        {
            print( "ViewController::imagePickerController: error passing picked image to view controller image." )
        }
        
        dismiss( animated: true, completion: nil )
    }
    
    @IBAction func pickAnImage( _ sender: AnyObject )
    {
      
        self.present( pickerController, animated: true, completion: nil )
    }

}

