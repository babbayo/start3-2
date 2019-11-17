//
//  ThirdViewController.swift
//  start3-2
//
//  Created by MacBook on 11/11/2019.
//  Copyright © 2019 yaco. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var weather: Weather?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let w = weather {
            self.title = w.cityName
            imageView.image = UIImage(named: w.stateImage)
            firstLabel.text = w.stateName
            secondLabel.text = w.description
            secondLabel.textColor = w.celsius < 10 ? .blue : .black
            thirdLabel.text = w.description2
            thirdLabel.textColor = w.rainfallProbaility > 50 ? .orange : .black
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
