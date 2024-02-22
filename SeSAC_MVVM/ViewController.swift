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
    
    viewModel.bindOutputResult { value in
//      self.resultLabel.text = self.viewModel.outputResult.text
      self.resultLabel.text = value
    }
//    
//    var a = Observable("3")
//    var b = Observable("2")
    
//    a.closure = {
//      print(a.text + b.text)
//    }
    
//    a.bind {
//      print(a.text + b.text)
//    }
    
//    a.text = "7"
//    a.text = "5"
    
    numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
  }
  
  @objc func numberTextFieldChanged() {
    viewModel.inputText = numberTextField.text!
//    resultLabel.text = viewModel.outputResult.text
  }
}

