//
//  UserViewModel.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation
// 비즈니스 로직만 담당하기 때문에 UIKit X

class UserViewModel {
  var list: [User] = [
    .init(name: "정환", age: 27),
    .init(name: "세윤", age: 24),
    .init(name: "준영", age: 24)
  ]
  
  var numberOfSections: Int {
    1
  }
  
  var numberOfRowsInSection: Int {
    list.count
  }
  
  func cellForRowAt(_ indexPath: IndexPath) -> User {
    return list[indexPath.row]
  }
}
