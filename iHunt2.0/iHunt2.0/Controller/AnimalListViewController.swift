//
//  AnimalListViewController.swift
//  iHunt2.0
//
//  Created by Huma Naushad on 2021-04-14.
//

import UIKit

class AnimalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var animalListView: UITableView!
    var animals = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Animal List"
        
        animalListView.dataSource = self
        animalListView.delegate = self
        animalListView.rowHeight = 118
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AnimalListCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AnimalListTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of AnimalCategoryTableViewCell.")
        }
        
        let animal = animals[indexPath.row]
        
        cell.nameLabel.text = animal.name
        cell.typeLabel.text = animal.label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let animal = animals[indexPath.row]
        let animalVC = storyboard?.instantiateViewController(identifier: "goToAnimalViewController") as! AnimalViewController
        
        animalVC.animal = animal
        self.navigationController?.pushViewController(animalVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
}
