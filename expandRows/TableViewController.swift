//
//  TableViewController.swift
//  expandRows
//
//  Created by eric yu on 11/6/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var fowardGround: UITableViewCell!
    
    @IBOutlet weak var background: UITableViewCell!
    
    
    @IBOutlet weak var switchAutoSync: UISwitch!
    @IBAction func switchAuto(_ sender: UISwitch) {
        if switchAutoSync.isOn {
           setView(view: fowardGround, hidden: false)
           setView(view: background, hidden: false)
        }else {
           setView(view: fowardGround, hidden: true)
           setView(view: background, hidden: true)
        }
    }

    func setView(view: UIView, hidden: Bool){
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        }, completion: nil)
        
    }
}


