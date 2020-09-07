//
//  ExpensesViewController.swift
//  Quarona
//
//  Created by Meshach Adoe on 06/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController{
    
    @IBOutlet weak var totalExpenses: UILabel!
    @IBOutlet weak var expenseTableView: UITableView!
    @IBOutlet weak var addExpenseField: UITextField!
    @IBOutlet weak var addValueField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Expense VC Activated")
    }
    
    @IBAction func addExpensePressed(_ sender: UIButton) {
    }
}
