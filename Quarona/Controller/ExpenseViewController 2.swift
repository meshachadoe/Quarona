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
    //        Expense(name: "Health Care", value: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseField.delegate = self
        addValueField.delegate = self
        expenseTableView.dataSource = self
        expenseTableView.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        addPadding(to: addExpenseField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addValueField.endEditing(true)
        return true
    }
    
    @IBAction func addExpensePressed(_ sender: UIButton) {
        if let expenseName = addExpenseField.text, let stringValue = addValueField.text {
            budgetManager.addExpense(expenseName, (stringValue as NSString).floatValue)
            updateTableView()
            print(expenses)
        }
    }
    
    func updateTableView() {
        expenses = budgetManager.getExpenses()
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
        cell.itemBox.backgroundColor = UIColor.black
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0
    }
}

extension ExpenseViewController {
    func addPadding(to textfield: UITextField) {
        textfield.layer.cornerRadius = 5
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1
        let padding = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textfield.leftView = padding
        textfield.leftViewMode = .always
    }
}
