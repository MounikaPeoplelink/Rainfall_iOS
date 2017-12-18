//
//  ViewController.swift
//  Rainfall
//
//  Created by Mounika on 12/14/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var swipeUpDownBtn: UIButton!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var queriesView: UIView!
    @IBOutlet weak var tableViewQueries: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // add the gesture recognizer to a view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        tapGesture.numberOfTapsRequired = 1
        upcomingView.addGestureRecognizer(tapGesture)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUpDown(recognizer:)))
        swipeUp.direction = .up
        queriesView.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUpDown(recognizer:)))
        swipeDown.direction = .down
        queriesView.addGestureRecognizer(swipeDown)
        self.tableViewQueries.estimatedRowHeight = 80
        self.tableViewQueries.rowHeight = UITableViewAutomaticDimension
        tableViewQueries.register(UINib(nibName: "QuriesTableViewCell", bundle: nil), forCellReuseIdentifier: "QuriesTableViewCell")
        tableViewQueries.contentInsetAdjustmentBehavior = .automatic
       // tableViewQueries.isScrollEnabled  = false
    }
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let calendarVC = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        self.navigationController?.pushViewController(calendarVC, animated: true)
    }
    @objc func handleSwipeUpDown(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .up || recognizer.direction == .down {
            swipeUpDownBtn.isSelected = recognizer.direction == .down ? true : false
            swipeUpDownAction(sender: swipeUpDownBtn)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuriesTableViewCell", for: indexPath) as! QuriesTableViewCell
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func upButtonAction(sender: UIButton){
        swipeUpDownAction(sender: sender)
    }
    
    func swipeUpDownAction(sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                
                var frame = self.queriesView.frame
                frame.origin.y = self.upcomingView.frame.maxY + 15
                self.queriesView.frame =  frame
            })
        } else {
            sender.isSelected = true
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                var frame = self.queriesView.frame
                frame.origin.y = self.calendarView.frame.minY
                self.queriesView.frame =  frame

            })
            
        }
    }
}


