//
//  DetailViewController.swift
//  ios02
//
//  Created by yuecaili on 16/5/30.
//  Copyright © 2016年 yuecaili. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var todoDate: UIDatePicker!
    @IBOutlet weak var todoItem: UITextField!
    
    var todo :TodoModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
        
        if todo == nil{
            childButton.selected = true
            navigationController?.title = "新增"
        }else{
            navigationController?.title = "修改"
            if todo?.image == "child-selected"{
                childButton.selected = true
            }
            else if todo?.image == "shopping-cart-selected"{
                shoppingButton.selected = true
            }
            else if todo?.image == "phone-selected"{
                phoneButton.selected = true
            }
            else if todo?.image == "travel-selected"{
                travelButton.selected = true
            }
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: true)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetBotton()  {
        childButton.selected = false
        phoneButton.selected = false
        shoppingButton.selected = false
        travelButton.selected = false
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        resetBotton()
        childButton.selected = true
    }
    
    @IBAction func phoneTapped(sender: AnyObject) {
        resetBotton()
        phoneButton.selected = true
    }
    
    @IBAction func shoppingTapped(sender: AnyObject) {
        resetBotton()
        shoppingButton.selected = true
    }

    @IBAction func travelTapped(sender: AnyObject) {
        resetBotton()
        travelButton.selected = true
    }
  
    @IBAction func okTapped(sender: AnyObject) {
        var img = ""
        if(childButton.selected){
            img = "child-selected"
        }else if(phoneButton.selected){
            img = "phone-selected"
        }else if(shoppingButton.selected){
            img = "shopping-cart-selected"
        }else{
            img = "travel-selected"
        }
        //let uuid = "333"
        
        if todo == nil{
            let todo = TodoModel(id:"6",image:img,title: todoItem.text!,date:todoDate.date)
            todos.append(todo)
        }else{
            todo?.image = img
            todo?.date = todoDate.date
            todo?.title = todoItem.text!
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }
    
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
