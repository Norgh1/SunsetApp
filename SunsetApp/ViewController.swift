//
//  ViewController.swift
//  SunsetApp
//
//  Created by Nor Gh on 7/27/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Sunset {
        let title:String
        let imageName:String
    }
    
    var data : [Sunset] = [
        Sunset(title: "Morning Run", imageName: "jpeg1"),
        Sunset(title: "Evning Sunset", imageName: "jpeg2"),
        Sunset(title: "Vacation Photos", imageName: "jpeg3"),
        Sunset(title: "Visiting Friends", imageName: "jpeg4"),
        Sunset(title: "Sunset Photos", imageName: "jpeg5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Sunset App!"
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
       
//MARK: - Here is AlertController for current Cell.
        
        if cell.isSelected {
            let alert = UIAlertController(title: "Attenation!", message: "There is only one Cell", preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style:.destructive, handler: nil)
            
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)
        }
    
        
        cell.myLabel.text = sunset.title
        cell.detailTextLabel?.text = "fd"
        cell.myImageView.image = UIImage(named: sunset.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

