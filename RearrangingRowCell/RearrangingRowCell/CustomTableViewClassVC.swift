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
//MARK: Stored Property
//=============================================================//

    var nameArray = ["Yogesh","Arvind","Sajal","Vinay","Akshay","Negi","Kartik","Aman","Kumar","Verma"]
    
//=============================================================//
//MARK: Defining IBOutlets
//=============================================================//
    
    @IBOutlet weak var customTableView: UITableView!
    
    @IBOutlet weak var editDoneTitleBtn: UIButton!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Friends List"
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        self.editDoneTitleBtn.setTitle("Edit", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editDoneBtnTapped(_ sender: UIButton) {
        
//=============================================================//
//MARK: Setting TableView To Edit OR Done Mode
//=============================================================//
        
        if self.customTableView.isEditing{
            //listTableView.editing = false;
            self.customTableView.setEditing(false, animated: false);
            self.editDoneTitleBtn.setTitle("Edit", for: .normal)
            //listTableView.reloadData();
        }
        else{
            //listTableView.editing = true;
            self.customTableView.setEditing(true, animated: true);
            self.editDoneTitleBtn.setTitle("Done", for: .normal)
            //listTableView.reloadData();
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForRowClass_ID") as? CellForRowClass else { fatalError("Cell Failed to load") }
        
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
        
        let temp = self.nameArray[sourceIndexPath.row]
        self.nameArray.remove(at: sourceIndexPath.row)
        self.nameArray.insert(temp, at: destinationIndexPath.row)
        
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

