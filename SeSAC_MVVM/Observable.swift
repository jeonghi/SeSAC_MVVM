//
//  Observable.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

// 실시간으로 달라지는 데이터를 감지

class Observable {
  
  // MARK: Internal
  var text: String {
    didSet {
      closure?()
    }
  }
  
  init(_ text: String) {
    self.text = text
  }
  
  func bind(_ closure: @escaping () -> Void){
    closure() // ⭐️ bind 즉시 클로져를 실행할 수 있음.
    // 🤷🏻‍♂️ 왜 즉시 실행시켜야하는거지 ⁉️
    self.closure = closure
  }
  
  // MARK: Private
  private var closure: (() -> Void)?
}
