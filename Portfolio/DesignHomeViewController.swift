//
//  DesignHomeViewController.swift
//  Portfolio
//
//  Created by 安念　玉希 on 2021/05/30.
//

import UIKit

class DesignHomeViewController: UIViewController {

    @IBOutlet weak var sellectedImage :UIImageView!
    @IBOutlet weak var outputLabel: UIImageView!
    
    @IBOutlet weak var Image1 :UIImageView!
    @IBOutlet weak var Image2 :UIImageView!
    @IBOutlet weak var Image3 :UIImageView!
    @IBOutlet weak var Image4 :UIImageView!

    var str = ""
    
       // 1. 遷移先に渡したい値を格納する変数を用意する
       var outputValue : UIImage?
       var output : [UIImage]!
    
       override func viewDidLoad() {
           super.viewDidLoad()
        sellectedImage.image = outputValue
        Image1.image = output[1]
        Image2.image = output[2]
        Image3.image = output[3]
        Image4.image = output[4]
        
       // sellectedImage.image = UIImage(named: outputValue)

       }
    
    
    
    var imagename : String?
    
    
    @IBOutlet weak var inputField: UITextField!

     
     //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // if segue.identifier == "fromDHVC1" {
             //let next = segue.destination as? EditViewController
           // next?.setTitle = self.inputField.text
        //  }
     //}
    
    
    
    @IBAction func goEdit(_ sender: Any){
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toEditViewController1" {
              let nextVC = segue.destination as? EditViewController
            nextVC?.outputValue = self.sellectedImage.image
            nextVC?.outputTitle = self.inputField.text
          }
      }
    
    
    
   // override func viewDidLoad() {
      //  super.viewDidLoad()
    //    imagename.text = outputValue

        // Do any additional setup after loading the view.
   // }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
