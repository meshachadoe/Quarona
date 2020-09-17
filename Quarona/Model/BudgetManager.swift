//
//  BudgetManager.swift
//  Quarona
//
//  Created by Meshach Adoe on 06/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import Foundation

struct BudgetManager {
    var expensesList: [Expense] = []
    var expenseTotal: Int = 0
    
    mutating func addExpense(_ expenseName: String, _ price: Float) {
        let newExpense = Expense(name: expenseName, value: price)
        expensesList.append(newExpense)
        expenseTotal += Int(newExpense.value)
    }
    
    func getTotalExpenses() -> Int {
        return expenseTotal
    }
    
    func getExpenses() -> [Expense] {
        return expensesList
    }
}
