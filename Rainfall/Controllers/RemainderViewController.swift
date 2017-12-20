//
//  RemainderViewController.swift
//  Rainfall
//
//  Created by Mounika on 12/20/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class RemainderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewRemainder: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewRemainder.register(UINib(nibName: "TFRemainderTableViewCell", bundle: nil), forCellReuseIdentifier: "TFRemainderTableViewCell")
        tableViewRemainder.contentInsetAdjustmentBehavior = .automatic

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAction(sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func editOrSaveButtonAction(sender: UIButton) {
        
        for i in 0...5 {
            if let cell = tableViewRemainder.cellForRow(at: IndexPath.init(row: i, section: 0)) as? TFRemainderTableViewCell {
                print(cell.textField.text ?? "")
            }
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TFRemainderTableViewCell", for: indexPath) as! TFRemainderTableViewCell
        cell.setContentForIndexpath(indexpath: indexPath)

        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
