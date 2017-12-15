//
//  ViewController.swift
//  Rainfall
//
//  Created by Mounika on 12/14/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var swipeUpDownBtn: UIButton!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var queriesView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainScrollView.contentSize = CGSize.init(width: self.view.frame.size.width, height: 800)
        mainScrollView.isScrollEnabled = false
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

    }
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let calendarVC = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        self.navigationController?.pushViewController(calendarVC, animated: true)
    }
    @objc func handleSwipeUpDown(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .up || recognizer.direction == .down {
            swipeUpDownBtn.isSelected = recognizer.direction == .up ? true : false
            swipeUpDownAction(sender: swipeUpDownBtn)
        }
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
                
                self.mainScrollView.contentOffset = CGPoint.zero
            })
        } else {
            sender.isSelected = true
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                
                self.mainScrollView.contentOffset = CGPoint(x: 0, y: sender.superview?.frame.origin.y ?? 0)
            })
            
        }
    }
}


