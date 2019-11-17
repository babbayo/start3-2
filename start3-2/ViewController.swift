//
//  ViewController.swift
//  start3-2
//
//  Created by MacBook on 11/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "countryCell"
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CountryTableViewCell {
        
            let imageName = "flag_"+countries[indexPath.row].assetName
            cell.leftImage.image = UIImage(named: imageName)
            cell.rightLabel.text = countries[indexPath.row].koreanName
            cell.countryIdx = indexPath.row
            return cell
        }
        
        print("error")
        return UITableViewCell()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder = JSONDecoder()
        guard let countryDataSet = NSDataAsset(name: "countries") else {
            print("no files")
            return
        }
        do {
            countries = try jsonDecoder.decode([Country].self, from: countryDataSet.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let next: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else {
            return
        }
        
        next.country = countries[cell.countryIdx]
    }

}

