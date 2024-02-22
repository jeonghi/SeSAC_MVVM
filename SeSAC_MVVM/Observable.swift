//
//  Observable.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

// 실시간으로 달라지는 데이터를 감지

class Observable {
  var text: String? {
    didSet {
      closure?()
    }
  }
  
  func bind(_ closure: @escaping () -> Void){
    self.closure = closure
  }
  
  var closure: (() -> Void)?
}
