//
//  TodoModel.swift
//  ios02
//
//  Created by yuecaili on 16/5/27.
//  Copyright © 2016年 yuecaili. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id:String
    var image:String
    var title:String
    var date:NSDate
    
    init(id:String,image:String,title:String,date:NSDate) {
        self.id = id
        self.image = image
        self.title=title
        self.date=date
    }
}
