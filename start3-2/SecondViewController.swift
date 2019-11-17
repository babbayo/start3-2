//
//  SecondViewController.swift
//  start3-2
//
//  Created by MacBook on 11/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "weatherCell"
    var country: Country?
    var weathers: [Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = country?.koreanName
        
        let jsonDecoder = JSONDecoder()
        
        guard let assetName = country?.assetName else {
            print("no asset name")
            return
        }
        
        guard let dataSet = NSDataAsset(name: assetName) else {
            print("no files")
            return
        }
        
        do {
            weathers = try jsonDecoder.decode([Weather].self, from: dataSet.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherTableViewCell {
        
            let weather = weathers[indexPath.row]
        
            cell.weatherIdx = indexPath.row
            cell.leftImage.image = UIImage(named: weather.stateImage)
            cell.firstLabel.text = weather.cityName
            cell.secondLabel.text = weather.description
            cell.secondLabel.textColor = weather.celsius < 10 ? .blue : .black
            cell.thirdLabel.text = weather.description2
            cell.thirdLabel.textColor = weather.rainfallProbaility > 50 ? .orange : .black
            return cell
        }
        
        print("error")
        return UITableViewCell()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let next: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: WeatherTableViewCell = sender as? WeatherTableViewCell else {
            return
        }
        
        next.weather = weathers[cell.weatherIdx]
    }

}
