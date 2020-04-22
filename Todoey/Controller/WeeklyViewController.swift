//
//  WeeklyViewController.swift
//  Todoey
//
//  Created by Dustin on 2020/04/22.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import ChameleonFramework

class WeeklyViewController: UIViewController {
    
    let list = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    let colourList : [UIColor] = [FlatRed(),FlatBlue(),FlatLime(),FlatMint(),FlatPink(),FlatPlum(),FlatTeal()]
    


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeeklyTableViewCell", bundle: nil), forCellReuseIdentifier: "WeeklyTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    



}


extension WeeklyViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyTableViewCell", for: indexPath) as! WeeklyTableViewCell
        cell.weeklyView.layer.cornerRadius = 10
        cell.weeklyView.clipsToBounds = true
        cell.weeklyView.backgroundColor = colourList[indexPath.row]
        cell.weeklyView.alpha = 0.9
        cell.weeklyLabel.text = list[indexPath.row]
        
        return cell
    }
    
    
    
}

