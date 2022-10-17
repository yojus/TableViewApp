//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by 杉浦陽樹 on 2022/10/16.
//

import UIKit

class AddListViewController: UIViewController {
    
    
    @IBOutlet weak var addText: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        
        if addText.text != "" {
            taskArray.append(addText.text!) //TextFieldで記入されたテキストを入れる
            
            userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
            
            self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
        } else {
            showAlert(title: "入力してください")
        }
        
    }
    
    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion:nil)
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
