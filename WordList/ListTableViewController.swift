//
//  WordListTableViewController.swift
//  WordList
//
//  Created by Masashi Aso on 2022/05/13.
//

import UIKit

class ListTableViewController: UITableViewController {
  var wordArray: [Dictionary<String, String>] = []
  let saveData = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if saveData.array (forKey: "WORD") != nil {
      wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
    }
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return wordArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
    let nowIndexPathDictionary = wordArray[indexPath.row]
    cell.englishLabel.text = nowIndexPathDictionary["english"]
    cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
    return cell
  }
}
