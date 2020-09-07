//
//  BudgetManager.swift
//  Quarona
//
//  Created by Meshach Adoe on 06/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import Foundation

struct Budget {
    var expensesList: [Expense] = []
    
    mutating func addExpense(name desc: String, value price: Float) {
        let newExpense = Expense(name: desc, value: price)
        expensesList.append(newExpense)
    }
    
    func getExpenses() -> [Expense] {
        return expensesList
    }
}
