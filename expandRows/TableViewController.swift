//
//  TableViewController.swift
//  expandRows
//
//  Created by eric yu on 11/6/17.
//  Copyright © 2017 eric yu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //first try - no longer in use
    @IBOutlet weak var fowardGround: UITableViewCell!
    @IBOutlet weak var background: UITableViewCell!
    @IBOutlet weak var switchAutoSync: UISwitch!
   
    //sencond attempt a collection view will make your life easier
    @IBOutlet var toggleCells: [UITableViewCell]!
    
    
    @IBAction func switchAuto(_ sender: UISwitch) {
        //with collection view we can u loop through it
        for cell in toggleCells {
            toggleView(view: cell, hidden: !sender.isOn)
        }
                self.tableView.reloadData()
    }
 
        /* first try this is bad
        if switchAutoSync.isOn {
           setView(view: fowardGround, hidden: false)
           setView(view: background, hidden: false)
        }else {
           setView(view: fowardGround, hidden: true)
           setView(view: background, hidden: true)
        }*/


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //auto sync is in section 1
        //wifi=row1,synconopen=row2,syninbackground=row3

        if indexPath.section == 0 && indexPath.row > 0 {
            if switchAutoSync.isOn == false {
                return 0
            }
        }
       // return 44
        //don't like to hard code the height
        print(UITableViewAutomaticDimension)
        return UITableViewAutomaticDimension
        
        
    }
    
    
    
    private func toggleView(view: UIView, hidden: Bool){
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        }, completion: nil)
    }

    func setView(view: UIView, hidden: Bool){
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        }, completion: nil)
    }
}

