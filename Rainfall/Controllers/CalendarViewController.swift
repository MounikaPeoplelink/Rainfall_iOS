//
//  CalendarViewController.swift
//  Rainfall
//
//  Created by Mounika on 12/15/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit
import FSCalendar
import MaterialComponents
class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var tableViewSchedules: UITableView!
    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    let addRemainderBtn = MDCFloatingButton()

    var datesToMark = ["2017-12-15","2017-12-17","2017-12-22","2018-01-04"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableViewSchedules.register(UINib(nibName: "CalendarTableViewCell", bundle: nil), forCellReuseIdentifier: "CalendarTableViewCell")
        tableViewSchedules.register(UINib(nibName: "CalendarHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CalendarHeaderView")

        tableViewSchedules.contentInsetAdjustmentBehavior = .automatic
        view.addSubview(addRemainderBtn)
        addRemainderBtn.translatesAutoresizingMaskIntoConstraints = false
        addRemainderBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        addRemainderBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16.0).isActive = true
        addRemainderBtn.backgroundColor = UIColor.init(red: 103/255, green: 58/255, blue: 183/255, alpha: 1)
        addRemainderBtn.setTitle("+", for: .normal)
        addRemainderBtn.setTitle("-", for: .selected)
        addRemainderBtn.addTarget(self, action: #selector(self.fabDidTap(sender:)), for: .touchUpInside)
    }
    @objc func fabDidTap(sender: UIButton) {
        let remainderVC = RemainderViewController(nibName: "RemainderViewController", bundle: nil)
        self.navigationController?.present(remainderVC, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonAction(sender: UIButton) {

    self.navigationController?.popViewController(animated: true)
    }
    @IBAction func calendarScopeAction(sender: UIButton) {
        if calendarView.scope == .week {
            calendarView.scope = .month
            calendarViewHeightConstraint.constant = 220
            backButton.isHidden = true

        } else {
            calendarView.scope = .week
            calendarViewHeightConstraint.constant = 120
            calendarView.setCurrentPage(calendarView.selectedDate ?? Date(), animated: true)
            backButton.isHidden = false

        }
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    
        calendarView.scope = .week
        calendarViewHeightConstraint.constant = 120

        calendarView.setCurrentPage(date, animated: true)
        backButton.isHidden = false
    }
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if datesToMark.contains(dateFormatter.string(from: date)) {
            return 1
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CalendarHeaderView") as! CalendarHeaderView
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
        cell.verticalLineBig.isHidden = (indexPath.row == 3) ? true : false
        cell.verticalLineSmall.isHidden = (indexPath.row == 0) ? true : false
        cell.verticalLineBig.alpha = 0.5
        cell.verticalLineSmall.alpha = 0.5
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
