//
//  IncomeViewController.swift
//  Quarona
//
//  Created by Meshach Adoe on 20/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var totalIncome: UILabel!
    @IBOutlet weak var incomeTableView: UITableView!
    @IBOutlet weak var addIncomeField: UITextField!
    @IBOutlet weak var addValueField: UITextField!
    
    var budgetManager = BudgetManager()
    var income: [Income] = [
//        Income(name: "Salary", value: 20.0),
//        Income(name: "Allowance", value: 300.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIncomeField.delegate = self
        addValueField.delegate = self
        incomeTableView.dataSource = self
        incomeTableView.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addValueField.endEditing(true)
        return true
    }
    
    @IBAction func addIncomePressed(_ sender: UIButton) {
        if let incomeName = addIncomeField.text, let stringValue = addValueField.text {
            print(incomeName)
            budgetManager.addIncome(incomeName, (stringValue as NSString).floatValue)
            income = budgetManager.getIncome()
            totalIncome.text = String(budgetManager.getTotalIncome())
            incomeTableView?.reloadData()
        }
    }
}

extension IncomeViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return income.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let newIncome = income[indexPath.row]
    let cell = incomeTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ExpenseCell
    cell.expenseName.text = newIncome.name
    cell.expenseValue.text = String(format: "%.0f", newIncome.value)
    return cell
}
}
