//
//  ViewController.swift
//  ios02
//
//  Created by yuecaili on 16/5/27.
//  Copyright © 2016年 yuecaili. All rights reserved.
//

import UIKit
var todos:[TodoModel] = []

class ViewController: UIViewController ,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [
            TodoModel(id:"1",image:"child-selected",title:"aaa",date:dateFromString("2016-01-01")!),
            TodoModel(id:"2",image:"child-selected",title:"bb",date:dateFromString("2016-01-01")!),
            TodoModel(id:"3",image:"child-selected",title:"cc",date:dateFromString("2016-01-01")!),
            TodoModel(id:"4",image:"child-selected",title:"dd",date:dateFromString("2016-01-01")!)
            ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dateFromString (dateStr: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(dateStr)
        return date
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todos.count
    }

    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell!
        let todo = todos[indexPath.row] as TodoModel
        let title = cell.viewWithTag(101) as! UILabel
        title.text = todo.title
        
        
        return cell
    }


}

