//
//  CustomTableViewClassVC.swift
//  RearrangingRowCell
//
//  Created by yogesh singh negi on 24/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

//=============================================================//
//MARK: CustomTableViewClassVC Class
//=============================================================//

class CustomTableViewClassVC: UIViewController {
    
//=============================================================//
//MARK: Stored Property - nameArray - Showing the list in the Table
//=============================================================//

    var nameArray = ["Yogesh","Arvind","Sajal","Vinay","Akshay","Negi","Kartik","Aman","Kumar","Verma"]
    
//=============================================================//
//MARK: Defining IBOutlets
//=============================================================//
    
    @IBOutlet weak var customTableView: UITableView!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the Title of the Navigation Item
        self.navigationItem.title = "My Friends List"
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        // Setting the Title of the RightBarButtonItem of the Navigation Item
        self.navigationItem.rightBarButtonItem?.title = "Edit"
        
    }
    
//=============================================================//
//MARK: Defining IBAction - Setting TableView To Edit OR Done Mode
//=============================================================//
    
    @IBAction func editNavigationBtnTapped(_ sender: UIBarButtonItem) {
        
      if self.customTableView.isEditing {
            // Setting TableView to Not Editing Mode
            self.customTableView.setEditing(false, animated: false)
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
            
        else {
            // Setting TableView to Editing Mode
            self.customTableView.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Done"
        }
    }
    
}


//=============================================================//
//MARK: CustomTableViewClassVC Class Extension
//=============================================================//

extension CustomTableViewClassVC: UITableViewDelegate,UITableViewDataSource{
    
//=============================================================//
//MARK: Setting Number Of Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
//=============================================================//
//MARK: Setting the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForRowClass_ID") as? CellForRowClass else { fatalError("Cell Failed to load at cellForRow") }
        
        cell.nameLabel.text = self.nameArray[indexPath.row]
        return cell
    }
    
//=============================================================//
//MARK: Setting Height Of the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//=============================================================//
//MARK: Rearranging Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Storing the name from the source index to the destination index
        let temp = self.nameArray[sourceIndexPath.row]
        self.nameArray.remove(at: sourceIndexPath.row)
        self.nameArray.insert(temp, at: destinationIndexPath.row)
    }
    
//=============================================================//
//MARK: Inserting New Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        // Setting the TableView in Editing Mode for adding new Row
        return UITableViewCellEditingStyle.insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.insert{
            self.nameArray.insert("New Element Inserted", at: indexPath.row)
            // One Row Will be inserted with animation
            tableView.insertRows(at: [indexPath], with: .middle)
            
        }
    }
  
}

//=============================================================//
//MARK: Class for Cell Label
//=============================================================//

class CellForRowClass: UITableViewCell{
    
//=============================================================//
//MARK: TableView IBOutlet
//=============================================================//
    
    @IBOutlet weak var nameLabel: UILabel!
    
}

