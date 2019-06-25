//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
var imagePicker = UIImagePickerController()


    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var photoPlaceholder: UIImageView!
    
    @IBOutlet weak var captionText: UITextField!
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func savedTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            
            photoToSave.caption = captionText.text
            
            if let userImage = photoPlaceholder.image {
                
                
                
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                { photoPlaceholder.image = selectedImage}
            }
            
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
