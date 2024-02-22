//
//  NumberViewModel.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

class NumberViewModel {
  
  var text: String? {
    didSet {
      text = validation(for: text)
    }
  }
  
  func bind(_ closure: @escaping () -> Void){
    self.closure = closure
  }
  
  var closure: (() -> Void)?
  
  // 데이터를 가공하는 과정은 숨기자.!
  private func validation(for text: String?) -> String {
    
    return { text in
      // 1. 문자
      guard let text, !text.isEmpty else {
        return "값을 입력해주세요"
      }
      
      // 2. 문자열
      guard let num = Int(text) else {
        return "숫자만 입력해주세요"
      }
      
      // 3. 숫자쉼표
      guard num > 0, num <= 1000000 else {
        return "100만원 이하로 입력해주세요"
      }
      
      let format = NumberFormatter()
      format.numberStyle = .decimal
      let result = format.string(for: num)
      return result ?? ""
    }(text)
    
  }
}
