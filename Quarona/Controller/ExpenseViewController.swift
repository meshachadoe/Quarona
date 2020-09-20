//
//  ExpensesViewController.swift
//  Quarona
//
//  Created by Meshach Adoe on 06/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var totalExpenses: UILabel!
    @IBOutlet weak var expenseTableView: UITableView!
    @IBOutlet weak var addExpenseField: UITextField!
    @IBOutlet weak var addValueField: UITextField!
    
    var budgetManager = BudgetManager()
    
    var expenses: [Expense] = []
//        Expense(name: "Grocery", value: 50),
//        Expense(name: "Health Care", value: 100),
//        Expense(name: "Grocery", value: 50),
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseField.delegate = self
        addValueField.delegate = self
        expenseTableView.dataSource = self
        expenseTableView.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addValueField.endEditing(true)
        return true
    }
    
    @IBAction func addExpensePressed(_ sender: UIButton) {
        if let expenseName = addExpenseField.text, let stringValue = addValueField.text {
            budgetManager.addExpense(expenseName, (stringValue as NSString).floatValue)
            expenses = budgetManager.getExpenses()
            totalExpenses.text = String(budgetManager.getTotalExpenses())
            expenseTableView?.reloadData()
        }
    }
}

extension ExpenseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expense = expenses[indexPath.row]
        let cell = expenseTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ExpenseCell
        cell.expenseName.text = expense.name
        cell.expenseValue.text = String(format: "%.0f", expense.value)
        return cell
    }
}
