//
//  NSObject+id.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import Foundation

extension NSObject {
  static var identifier: String {
    String(describing: self)
  }
}
