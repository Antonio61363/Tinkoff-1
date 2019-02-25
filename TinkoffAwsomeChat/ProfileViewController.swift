//
//  ViewController.swift
//  TinkoffAwsomeChat
//
//  Created by Антон on 07/02/2019.
//  Copyright © 2019 AntonChernyshev. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var editButton: UIButton! {
        didSet {
            editButton.layer.cornerRadius = 5
            editButton.layer.borderWidth = 1
            editButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            editButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profilePictureChooser: UIButton! {
        didSet {
            profilePictureChooser.layer.cornerRadius = profilePictureChooser.frame.height / 2
            profilePictureChooser.clipsToBounds = true
            profilePictureChooser.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        }
    }
    
    @IBAction func profilePictureChoose(_ sender: Any) {
        
        createChoosePhotoAlert()
        
        print("Выбери изображение профиля!")
    }
    
    private func createChoosePhotoAlert () {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController (title: "Изменить фото профиля?", message: "Выберете источник", preferredStyle: .alert)
        
        let choosePictureFromLibrary = UIAlertAction(title: "Фото", style: .default) { (action:UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        alertController.addAction(choosePictureFromLibrary)
        
        let takePictureFromCamera = UIAlertAction(title: "Камера", style: .default) { (action:UIAlertAction) in
            imagePicker.sourceType = .camera
            imagePicker.cameraDevice = .rear
            imagePicker.showsCameraControls = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(takePictureFromCamera)
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel) { (action:UIAlertAction) in
        }
        
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func choosePictureOrMakePhoto(sourse: String)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profilePictureChooser.frame.height / 2
        profileImage.clipsToBounds = true
        
        print(editButton.frame)
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(editButton.frame) // Сначала происходит загрузка метода viewDidLoad один раз и инициализируются все вьюхи, после этого viewDidAppear вызывается и располагает объекты в соответствие с требованиями.
        
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
