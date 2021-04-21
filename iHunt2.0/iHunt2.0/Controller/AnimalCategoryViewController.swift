//
//  AnimalCategoryViewController.swift
//  iHunt2.0
//
//  Created by Huma Naushad on 2021-04-14.
//

import UIKit

class AnimalCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var animalCategoryView: UITableView!
    
    var animalCat = [AnimalCategory]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Animal Category"
        
        loadAnimals()
        
        animalCategoryView.dataSource = self
        animalCategoryView.delegate = self
        animalCategoryView.rowHeight = 118
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AnimalCategoryCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AnimalCategoryTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of AnimalCategoryTableViewCell.")
        }
        
        let aCategory = animalCat[indexPath.row]
        
        cell.nameLabel.text = aCategory.type.rawValue
        cell.photoImageView.image = aCategory.photo
        cell.typeLabel.text = aCategory.label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalCat.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let aCategory = animalCat[indexPath.row]
        let animalListVC = storyboard?.instantiateViewController(identifier: "goToAnimalListViewController") as! AnimalListViewController
        animalListVC.animals = aCategory.animalArr
        self.navigationController?.pushViewController(animalListVC, animated: true)
    }
    
    //MARK: Private Methods
    
    private func loadAnimals() {
        
        var catArr = [Animal]()
        var dogArr = [Animal]()
        var hogArr = [Animal]()
        
        let cats = UIImage(named: "cat")
        let hedgehogs = UIImage(named: "hedgehog")
        let dogs = UIImage(named: "dog")
        let rabbits = UIImage(named: "rabbit")
        let ducks = UIImage(named: "duck")
        
        let cat1 = Animal(name: "Cat1", label: "bg", photo: cats, file : "Catsound1")
        let cat2 = Animal(name: "Cat2", label: "bg", photo: cats, file : "Catsound1")
        catArr += [cat1, cat2]
        
        let dog1 = Animal(name: "Dog1", label: "gt", photo: dogs, file : "Dogsound1")
        let dog2 = Animal(name: "Dog2", label: "gt", photo: dogs, file : "Dogsound1")
        dogArr += [dog1, dog2]
        
        let hog1 = Animal(name: "Hog1", label: "tt", photo: hedgehogs, file : "Hedgehogsound1")
        let hog2 = Animal(name: "Hog2", label: "tt", photo: hedgehogs, file : "Hedgehogsound1")
        hogArr += [hog1, hog2]
        
        let aCat = AnimalCategory(type: AnimalType.Cat, animalArr: catArr, label: "distress", photo: cats)
        let aDog = AnimalCategory(type: AnimalType.Dog, animalArr: dogArr, label: "distress", photo: dogs)
        let aHog = AnimalCategory(type: AnimalType.Hedgehog, animalArr: hogArr, label: "distress", photo: hedgehogs)
        
    
        animalCat += [aCat, aDog, aHog]
    }
    
}
