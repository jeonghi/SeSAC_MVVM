//
//  Observable.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

// ⭐️ class로 할때랑 struct로 할때의 차이가 뭘까?!
@propertyWrapper
class Observable<T> {
  
  var wrappedValue: T {
    didSet {
      _closure?(wrappedValue)
    }
  }
  
  private var _closure: ((T) -> Void)?
  
  init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
  
  func bind(_ closure: ((T) -> Void)?) {
    closure?(wrappedValue)
    _closure = closure
  }
}

