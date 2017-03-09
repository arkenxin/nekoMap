//
//  AnimalSubTableViewController.swift
//  nekoMap
//
//  Created by jinikuadmin on 3/9/17.
//  Copyright © 2017 xin. All rights reserved.
//

import UIKit

class AnimalSubTableViewController: UITableViewController {
    
    var animals = [Animals]()
    
    private func loadAnimals(){
        let icon1 = UIImage(named: "Cat")
        let icon2 = UIImage(named: "Hedgehog")
        let icon3 = UIImage(named: "Owl")
        let icon4 = UIImage(named: "Rabbit")
        
        guard let animal1 = Animals(name: "Cat Cafe", icon: icon1) else { fatalError ("No animal cafes of that sort")
        }
        guard let animal2 = Animals(name: "Hedgehog Cafe", icon: icon2) else { fatalError ("No animal cafes of that sort")
        }
        guard let animal3 = Animals(name: "Owl Cafe", icon: icon3) else { fatalError ("No animal cafes of that sort")
        }
        guard let animal4 = Animals(name: "Rabbit Cafe", icon: icon4) else { fatalError ("No animal cafes of that sort")
        }
        
        animals += [animal1, animal2, animal3, animal4]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAnimals()
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AnimalTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AnimalTableViewCell else {
            fatalError("The dequeued cell is not an instance of AnimalTableViewCell")
        }

        cell.selectionStyle = .none

        // Fetches appropriate animal for data source layout
        let animal = animals[indexPath.row]
        
        cell.animalLabel.text = animal.name
        cell.animalIcon.image = animal.icon

        return cell
    }
    
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
