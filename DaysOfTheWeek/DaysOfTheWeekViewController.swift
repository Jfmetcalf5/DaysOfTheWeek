//
//  DaysOfTheWeekViewController.swift
//  DaysOfTheWeek
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class DaysOfTheWeekViewController: UIViewController {
    
    var daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    @IBOutlet weak var daysOfTheWeekTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysOfTheWeekTableView.dataSource = self
        daysOfTheWeekTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check  ID
        if segue.identifier == "toDayDetailVC" {
            // Get the destination
            guard let destinationVC = segue.destination as? DayDetailViewController else { return }
            // Get the selected day
            if let selectedDay = daysOfTheWeekTableView.indexPathForSelectedRow {
                // Get the day indexPath
                let day = daysOfTheWeek[selectedDay.row]
                // Pass the selected day to the detailedVC
                destinationVC.day = day
            }
        }
    }
}


extension DaysOfTheWeekViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfTheWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        let day = daysOfTheWeek[indexPath.row]
        
        cell.textLabel?.text = day
        
        return cell
    }
    
    // When the user didSelect on  a row (or tapps) we are going to see the indexPath loggd into the consol...
    // - THIS IS JUST FOR US for now
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}
