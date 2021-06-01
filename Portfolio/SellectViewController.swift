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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedsegmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("A4横")
            self.DisplayLabel1.text = "A4横1"
            self.DisplayLabel2.text = "A4横2"
            self.View1.image = UIImage(named: "A4yoko.png")!
            self.View2.image = UIImage(named: "A4yoko2.png")
        case 1:
            print("A4縦")
            self.DisplayLabel1.text = "A4縦"
            self.View1.image = UIImage(named: "A4tate.png")!
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
          }
        if segue.identifier == "select2" {
            let nextVC = segue.destination as? DesignHomeViewController
          nextVC?.outputValue = self.View2.image
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
