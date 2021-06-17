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
        
        // Screen Size の取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // タッチ操作を enable
        photoImageView1.isUserInteractionEnabled = true
        photoImageView2.isUserInteractionEnabled = true
        
        self.view.addSubview(photoImageView1)
        self.view.addSubview(photoImageView2)
        
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
       override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           // タッチイベントを取得
           let touchEvent = touches.first!
           
           // ドラッグ前の座標, Swift 1.2 から
           let preDx = touchEvent.previousLocation(in: self.view).x
           let preDy = touchEvent.previousLocation(in: self.view).y
           
           // ドラッグ後の座標
           let newDx = touchEvent.location(in: self.view).x
           let newDy = touchEvent.location(in: self.view).y
           
           // ドラッグしたx座標の移動距離
           let dx = newDx - preDx
           print("x:\(dx)")
           
           // ドラッグしたy座標の移動距離
           let dy = newDy - preDy
           print("y:\(dy)")
           
        
           // 画像のフレーム
           var viewFrame1: CGRect = photoImageView1.frame
           
           // 移動分を反映させる
           viewFrame1.origin.x += dx
           viewFrame1.origin.y += dy
           
        photoImageView1.frame = viewFrame1
           
           self.view.addSubview(photoImageView1)
            
        
       }
    
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    var myImageView: UIImageView!
    
    @IBAction func onClickMyButton() {
            // キャプチャ画像を取得.
            let myImage = photoImageView1.GetImage() as UIImage

            // ImageViewのimageにセット.
        myImageView.image = myImage

            // 縦横比率を保ちつつ画像をUIImageViewの大きさに合わせる.
            
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        }
    
}

extension UIView {

    func GetImage() -> UIImage{

        // キャプチャする範囲を取得.
        let rect = self.bounds

        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!

        // 対象のview内の描画をcontextに複写する.
        self.layer.render(in: context)

        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!

        // contextを閉じる.
        UIGraphicsEndImageContext()

        return capturedImage
    }
}
