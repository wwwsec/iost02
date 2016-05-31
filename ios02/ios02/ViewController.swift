//
//  ViewController.swift
//  ios02
//
//  Created by yuecaili on 16/5/27.
//  Copyright © 2016年 yuecaili. All rights reserved.
//

import UIKit
var todos:[TodoModel] = []
var filteredtodos:[TodoModel] = []

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate, UISearchDisplayDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [
            TodoModel(id:"1",image:"child-selected",title:"aaa",date:dateFromString("2016-01-01")!),
            TodoModel(id:"2",image:"phone",title:"bb",date:dateFromString("2016-01-01")!),
            TodoModel(id:"3",image:"shopping-cart",title:"cc",date:dateFromString("2016-01-01")!),
            TodoModel(id:"4",image:"travel",title:"dd",date:dateFromString("2016-01-01")!)
            ]
        navigationItem.leftBarButtonItem = editButtonItem()
        var offset = tableView.contentOffset
        offset.y += (searchDisplayController?.searchBar.frame.size.height)!
        tableView.contentOffset = offset
        
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
        if tableView == searchDisplayController?.searchResultsTableView{
            return filteredtodos.count
        }else{
            return todos.count
        }
        
    }

    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell!
        var todo:TodoModel
        if tableView == searchDisplayController?.searchResultsTableView{
            todo = filteredtodos[indexPath.row] as TodoModel
        }
        else{
            todo = todos[indexPath.row] as TodoModel
        }
        
        //let todo = todos[indexPath.row] as TodoModel
        let title = cell.viewWithTag(101) as!UILabel
        let date = cell.viewWithTag(102) as!UILabel
        let img = cell.viewWithTag(103) as!UIImageView
        title.text = todo.title
        img.image = UIImage(named: todo.image)
        
        let locale = NSLocale.currentLocale()
        let dateformat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd",options:  0, locale: locale)
        let dateformater = NSDateFormatter()
        dateformater.dateFormat = dateformat
        date.text = dateformater.stringFromDate(todo.date)
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            todos.removeAtIndex(indexPath.row)
            //self.tableView.reloadData(
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }

    @IBAction func close(segue:UIStoryboardSegue){
        print("closed")
        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "edit"){
            let vc = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            
            if let index = indexPath{
                vc.todo = todos[index.row]
            }
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        let todo = todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool{
        filteredtodos = todos.filter({$0.title.rangeOfString(searchString!) != nil})
        
        return true
    }
    

}

