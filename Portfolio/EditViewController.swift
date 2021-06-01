//
//  EditViewController.swift
//  Portfolio
//
//  Created by 安念　玉希 on 2021/05/30.
//

import UIKit

class EditViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var setTitle: UILabel!

        // 1. 遷移先に渡したい値を格納する変数を用意する
        var outputValue : UIImage?
        var outputTitle : String?
    
  //  @IBOutlet var haikeiImageView: UIImageView!
    @IBOutlet var photoImageView1:UIImageView!
    @IBOutlet var photoImageView2:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle.text = outputTitle
        editImage.image = outputValue

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTappedAlbumButton1(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    @IBAction func onTappedAlbumButton2(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true, completion: nil)
        photoImageView1.image = info[.originalImage]as?UIImage
    }
    

    func drawMaskImage(image: UIImage) -> UIImage {
        let maskImage = UIImage(named: "photoImageView1")!
        
        UIGraphicsBeginImageContext(image.size)
        
        image.draw(in: CGRect(x: 0, y:0, width: image.size.width, height: image.size.height))
        
        let margin: CGFloat = 50.0
        let maskRect = CGRect(x: image.size.width - maskImage.size.width - margin,
                              y: image.size.height - maskImage.size.height - margin,
                              width: maskImage.size.width, height: maskImage.size.height)
        
        maskImage.draw(in: maskRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
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
