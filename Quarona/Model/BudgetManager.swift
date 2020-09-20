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
    var incomeList: [Income] = []
    var expenseTotal: Int = 0
    var incomeTotal: Int = 0
    
    mutating func addExpense(_ expenseName: String, _ price: Float) {
        let newExpense = Expense(name: expenseName, value: price)
        expensesList.append(newExpense)
        expenseTotal += Int(newExpense.value)
    }
    
    mutating func addIncome(_ incomeName: String, _ price: Float) {
        let newIncome = Income(name: incomeName, value: price)
        incomeList.append(newIncome)
        print(incomeList)
        incomeTotal += Int(newIncome.value)
    }
    
    func getTotalExpenses() -> Int {
        return expenseTotal
    }
    
    func getTotalIncome() -> Int {
        return incomeTotal
    }
    
    func getExpenses() -> [Expense] {
        return expensesList
    }
    
    func getIncome() -> [Income] {
        return incomeList
    }
}
