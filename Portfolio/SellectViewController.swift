//
//  SellectViewController.swift
//  Portfolio
//
//  Created by 安念　玉希 on 2021/05/30.
//

import UIKit

class SellectViewController: UIViewController {

    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    @IBOutlet weak var DisplayLabel1: UILabel!
    @IBOutlet weak var DisplayLabel2: UILabel!
    
    @IBOutlet weak var View1: UIImageView!
    @IBOutlet weak var View2: UIImageView!
    
    var t1: [UIImage]!
    var t2: [UIImage]!
    var y1: [UIImage]!
    var y2: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func tappedsegmentChanged(sender: UISegmentedControl) {
        
        t1 = [UIImage(named:"t11.jpg")!,
              UIImage(named:"t12.jpg")!,
              UIImage(named:"t13.jpg")!,
              UIImage(named:"t14.jpg")!,
              UIImage(named:"t15.jpg")!,]
        
        t2 = [UIImage(named:"t21.jpg")!,
              UIImage(named:"t22.jpg")!,
              UIImage(named:"t23.jpg")!,
              UIImage(named:"t24.jpg")!,
              UIImage(named:"t25.jpg")!,]
        
        y1 = [UIImage(named:"y11.jpg")!,
              UIImage(named:"y12.jpg")!,
              UIImage(named:"y13.jpg")!,
              UIImage(named:"y14.jpg")!,
              UIImage(named:"y15.jpg")!,]
        
        y2 = [UIImage(named:"y21.jpg")!,
              UIImage(named:"y22.jpg")!,
              UIImage(named:"y23.jpg")!,
              UIImage(named:"y24.jpg")!,
              UIImage(named:"y25.jpg")!,]
        
        switch sender.selectedSegmentIndex{
        case 0:
            print("A4横")
            self.DisplayLabel1.text = "A4横1"
            self.DisplayLabel2.text = "A4横2"
            self.View1.image = y1[0]
            self.View2.image = y2[0]
        case 1:
            print("A4縦")
            self.DisplayLabel1.text = "A4縦1"
            self.DisplayLabel1.text = "A4縦2"
            self.View1.image = t1[0]
            self.View2.image = t2[0]
        default:
            print("選択されたもの：未選択")
            self.DisplayLabel1.text = "未選択"
        }

    }
    
   // @IBOutlet weak var inputField: UITextField!
    
    @IBAction func select1(_ sender: Any){
        self.performSegue(withIdentifier: "select1", sender: nil)
    }
    
    @IBAction func select2(_ sender: Any){
        self.performSegue(withIdentifier: "select2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "select1" {
              let nextVC = segue.destination as? DesignHomeViewController
            nextVC?.outputValue = self.View1.image
             // nextVC?.outputValue = self.inputField.text
            
            let next = segue.destination as? DesignHomeViewController
            if View1.image == t1[0]{
              next?.output = t1
            } else if View1.image == y1[0]{
                next?.output = y1
            }
            
          }else if segue.identifier == "select2" {
            let nextVC = segue.destination as? DesignHomeViewController
          nextVC?.outputValue = self.View2.image
            
            let next = segue.destination as? DesignHomeViewController
            
            if View2.image == t2[0]{
              next?.output = t2
            } else if View2.image == y2[0]{
                next?.output = y2
            }
           // nextVC?.outputValue = self.inputField.text
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

extension UIImageView {
    
func getImageName() -> String?{
    return self.image?.accessibilityIdentifier
}
}
