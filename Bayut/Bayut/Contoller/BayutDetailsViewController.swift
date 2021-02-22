//
//  BayutDetailsViewController.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import UIKit

class BayutDetailsViewController: UIViewController {

    @IBOutlet weak var stuffImageView       : UIImageView!
    @IBOutlet weak var createdLabel         : UILabel!
    @IBOutlet weak var uidLabel             : UILabel!
    var stuffModel                          :   StuffData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.intialSetup()
        view.accessibilityIdentifier = "Detail View"
      }
    
    
    func intialSetup(){
        createdLabel.text = stuffModel?.created
        uidLabel.text     = stuffModel?.uid
        let imageURl = (stuffModel?.imageURL[0])
        stuffImageView.url(imageURl)
        self.title = "Stuff List Details"
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = "Stuff List Details"
    }
    


}
