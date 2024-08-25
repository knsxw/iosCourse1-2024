//
//  ViewController.swift
//  Solar System
//
//  Created by Sasori on 24/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    var planets : [(img: String, name: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        planets.append(("mercury", "Mercury"))
        planets.append(("venus", "Venus"))
        planets.append(("earth", "Earth"))
        planets.append(("mars", "Mars"))
        planets.append(("jupiter", "Jupiter"))
        planets.append(("saturn", "Saturn"))
        planets.append(("uranus", "Uranus"))
        planets.append(("neptune", "Neptune"))
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let planetIndex = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "solar_cell", for: indexPath) as! SolarCell
        cell.planetImageView.image = UIImage(named: planets[planetIndex].img)
        cell.planetName.text = planets[planetIndex].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = storyboard?.instantiateViewController(identifier: "solar") as! PlanetViewController
        detail.img = planets[indexPath.item].img
        detail.name = planets[indexPath.item].name
        navigationController?.pushViewController(detail, animated: true)
    }
}
