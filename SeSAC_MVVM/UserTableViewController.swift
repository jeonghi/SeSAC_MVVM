//
//  UserTableViewController.swift
//  SeSAC_MVVM
//
//  Created by 쩡화니 on 2/22/24.
//

import UIKit // 얘를 주석처리해서 빨간줄로 뜨는 것들은 바깥으로 분리시킬수 없는 것들임.
// 뷰적인 모든 것들을 담당. UIKit O, 뷰 모델 인스턴스만 갖고 있음.

class UserTableViewController: UITableViewController {
  
  let viewModel = UserViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return viewModel.numberOfSections
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return viewModel.numberOfRowsInSection
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
    cell.textLabel?.text = viewModel.cellForRowAt(indexPath).name
    return cell
  }
}
