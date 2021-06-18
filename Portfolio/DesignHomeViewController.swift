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

    var sellectedImageSet : [UIImage]!
    var str = ""
    
       // 1. 遷移先に渡したい値を格納する変数を用意する
       var outputValue : UIImage?
       var output : [UIImage]!
    
       override func viewDidLoad() {
           super.viewDidLoad()
        sellectedImage.image = output[0]
        sellectedImageSet = output
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
    
    
    var number: Int = 0
    
   
    
    @IBAction func Button1(_ sender: Any){
        number = 1
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
        print(number)
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        number = 2
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
        print(number)
    }
    
    @IBAction func Button3(_ sender: Any){
        number = 3
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
        print(number)
    }
    
    @IBAction func Button4(_ sender: Any){
        number = 4
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
        print(number)
    }
    
    @IBAction func Button5(_ sender: Any){
        number = 5
        self.performSegue(withIdentifier: "toEditViewController1", sender: nil)
        print(number)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toEditViewController1" {
              let nextVC = segue.destination as? EditViewController
            
            if number == 1{
            nextVC?.outputValue = self.sellectedImage.image
            nextVC?.outputTitle = self.inputField.text
            nextVC?.imageSet = self.sellectedImageSet
            }else if number == 2{
                nextVC?.outputValue = self.Image1.image
                nextVC?.imageSet = self.sellectedImageSet
            }else if number == 3{
                nextVC?.outputValue = self.Image2.image
                nextVC?.imageSet = self.sellectedImageSet
            }else if number == 4{
                nextVC?.outputValue = self.Image3.image
                nextVC?.imageSet = self.sellectedImageSet
            }else if number == 5{
                nextVC?.outputValue = self.Image4.image
                nextVC?.imageSet = self.sellectedImageSet
            }
            
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


