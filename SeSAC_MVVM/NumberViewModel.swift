//
//  NumberViewModel.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

class NumberViewModel {
  
  @Observable var inputText: String = ""
  @Observable var outputResult: String = ""
  
  init() {
    _inputText.bind { self.validation($0) }
  }
  
  // 데이터를 가공하는 과정은 숨기자.!
  private func validation(_ text: String) {
    outputResult = { text in
      // 1. 문자
      guard text.isEmpty else {
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
  
  // ⭐️ 프로퍼티 래퍼를 사용할때 Swift가 자동으로 생성하는 `_` 접두사가 붙은 인스턴스 변수는 private 접근 수준을 가짐.
  // ViewModel 외부에서 직접적으로 인스턴스 변수에 접근할 수가 없기 때문에... 따로 설정할 수 있는 메서드를 뷰 모델에 정의했는데, 이래도 되나 싶음.
  // 캡슐화를 위해서 프로퍼티 래퍼를 쓰는건데,,,,
  func bindOutputResult(_ closure: @escaping (String) -> Void) {
      _outputResult.bind(closure)
  }
}
