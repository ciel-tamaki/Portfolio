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
    var sellectImageSet : [UIImage]!
        // 1. 遷移先に渡したい値を格納する変数を用意する
        var outputValue : UIImage?
        var outputTitle : String?
         var imageSet : [UIImage]!
       
    
  //  @IBOutlet var haikeiImageView: UIImageView!
    @IBOutlet var photoImageView1:UIImageView!
    @IBOutlet var photoImageView2:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle.text = outputTitle
        editImage.image = outputValue
        sellectImageSet = imageSet

        // Do any additional setup after loading the view.
        
        // Screen Size の取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // タッチ操作を enable
        photoImageView1.isUserInteractionEnabled = true
        photoImageView2.isUserInteractionEnabled = true
        
        
    }
    
    
    var number : Int = 0
    
    @IBAction func onTappedAlbumButton1(){
        presentPickerController(sourceType: .photoLibrary)
        number = 1
    }
    
    @IBAction func onTappedAlbumButton2(){
        presentPickerController(sourceType: .photoLibrary)
        number = 2
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
        if number == 1 {
        photoImageView1.image = info[.originalImage]as?UIImage
        }else if number == 2 {
            photoImageView2.image = info[.originalImage]as?UIImage
        }
    }
    
    

    
    @IBAction func pinchImage(_ sender: UIPinchGestureRecognizer) {
        photoImageView1.transform = CGAffineTransform(scaleX:sender.scale, y:sender.scale)
    }
    
    @IBAction func onTappedUPloadButton(){
        if editImage.image != nil {
            let activityVC = UIActivityViewController(activityItems: [editImage.image!], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    var pinchNumber: Int = 0
  
    @IBAction func onTappedView1(_ sender: UIPinchGestureRecognizer) {
        pinchNumber = 1
    }
    
    @IBAction func onTappedView(_ sender: UITapGestureRecognizer) {
        pinchNumber = 2
    }
    // 画面にタッチで呼ばれる
       
       
       //　ドラッグ時に呼ばれる
      // override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           // タッチイベントを取得
        //   let touchEvent = touches.first!
           
           // ドラッグ前の座標, Swift 1.2 から
          // let preDx = touchEvent.previousLocation(in: self.view).x
           //let preDy = touchEvent.previousLocation(in: self.view).y
           
           // ドラッグ後の座標
           //let newDx = touchEvent.location(in: self.view).x
           //let newDy = touchEvent.location(in: self.view).y
           
           // ドラッグしたx座標の移動距離
           //let dx = newDx - preDx
           //print("x:\(dx)")
           
           // ドラッグしたy座標の移動距離
           //let dy = newDy - preDy
          // print("y:\(dy)")
           
        
           // 画像のフレーム
           //var viewFrame1: CGRect = photoImageView1.frame
           
           // 移動分を反映させる
           //viewFrame1.origin.x += dx
          // viewFrame1.origin.y += dy
           
     //   photoImageView1.frame = viewFrame1
           
        
            
        
       //}
    
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

    
    //戻るボタン
    @IBAction func Back(_ sender: Any){
        self.performSegue(withIdentifier: "toDesignHomeViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toDesignHomeViewController" {
            let next = segue.destination as? DesignHomeViewController
              next?.output = sellectImageSet
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
    
    

    
   @IBOutlet var targetView: UIView!
   @IBOutlet  var resultImageView: UIImageView!
    
    @IBAction func takeScreenshot() {
        let result = targetView.takeScreenshot()
           resultImageView.image = result
        
        if resultImageView.image != nil{
            let activityVC = UIActivityViewController(activityItems: [resultImageView.image], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }else {
            print("画像がありません")
        }
       }
   }

extension UIView {

    func takeScreenshot() -> UIImage {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
}
