//
//  ViewController.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var numberTextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  let viewModel: NumberViewModel = .init()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
  }
  
  @objc func numberTextFieldChanged() {
    viewModel.text = numberTextField.text
    resultLabel.text = viewModel.text
  }
}

