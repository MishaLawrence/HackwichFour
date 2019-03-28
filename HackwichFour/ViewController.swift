//
//  ViewController.swift
//  HackwichFour
//
//  Created by Marion Ano on 2/28/19.
//  Copyright © 2019 Marion Ano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//declare our array

  
    var myFriends = ["Ryan", "Nicole", "Sara", "Tyler"]

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myFriends.count
        //return 4

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
    
        //Code Block
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = myFriends[indexPath.row]
        cell.textLabel?.text=text
        return cell
    }


    var restaurantImageData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //part 7
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        //set restaurantImageDate to the dictionary  object for key 
        restaurantImageData = dict!.object(forKey:"restaurantImages") as! [String]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //code statements we need to write in order to pass the data from the pList through the Segue:
        //create an if statement that checks the identifier of the Segue, in this case we want to make sure the Segue is “mySegue”
        if segue.identifier == "mySegue"
        {
            //create an if statement that checks the identifier of the Segue, in this case we want to make sure the Segue is “mySegue”
            let s1 = segue.destination as! detailViewController
            //create a variable that holds the index of the cell that's tabbed
            let imageIndex = tableView.indexPathForSelectedRow?.row
            
            s1.imagePass = restaurantImageData[imageIndex!]
        }
    }

}


