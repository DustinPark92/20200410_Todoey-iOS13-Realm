//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    //#1 NsCoder ENcoder Item.plst -> file 생성,저장
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    //let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        
//        print(dataFilePath)
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        itemArray.append(newItem)
//        
//        let newItem2 = Item()
//        newItem2.title = "Find Mike!"
//        itemArray.append(newItem2)
//        
//        let newItem3 = Item()
//        newItem3.title = "Find Mike!!"
//        itemArray.append(newItem3)
        
        
        loadItems()
        
        // Casting 해줘야 한다.
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//
//            itemArray = items
//
//        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        var item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : . none
        
        // Tenary Operator ==> value = condition? valueIfTrue : valueIfFalse
        //        if item.done == true {
        //            cell.accessoryType = .checkmark
        //        } else {
        //            cell.accessoryType = .none
        //        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
        //         => 한글자로 줄이면
        //        if itemArray[indexPath.row].done == false {
        //            itemArray[indexPath.row].done = true
        //
        //        } else {
        //            itemArray[indexPath.row].done = false
        //        }
        //reload 해야 item[indexPath.row].done => update 됌.
        
        
        //        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        //
        //        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        //        } else {
        //
        //            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //        }
        //누를때 회색으로 변하지만 다시 돌아옴
        
        
        
        
        
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks Add Item button on out UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            //#2 NScoder Encoder
            self.saveItems()

            

           // self.defaults.set(self.itemArray, forKey: "TodoListArray")

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            print(alertTextField.text)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    //encoder
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to:dataFilePath!)
        } catch {
            
            print("\(error)")
            
        }
        self.tableView.reloadData()
    }
    
    
    //#1 decoder
    func loadItems() {
        
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
            print(123)
            }
        }
        
    }
}



