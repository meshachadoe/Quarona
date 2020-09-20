//
//  ViewController.swift
//  Quarona
//
//  Created by Meshach Adoe on 06/09/20.
//  Copyright © 2020 Meshach Adoe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var expensesLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        budgetLabel.text = "0"
        expensesLabel.text = "0"
        incomeLabel.text = "0"
    }
    
    @IBAction func budgetBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBudget", sender: self)
    }
    
    @IBAction func expenseBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToExpenses", sender: self)
    }
    
    @IBAction func incomeBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToIncome", sender: self)
    }


}

