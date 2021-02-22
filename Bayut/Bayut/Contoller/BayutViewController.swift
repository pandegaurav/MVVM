//
//  BayutViewController.swift
//  Bayut
//
//  Created by Pande, Gaurav on 19/02/21.
//

import UIKit

class BayutViewController: UIViewController, UITableViewDelegate {
    
    
    // MARK: - IBOutlet

    @IBOutlet weak var bayutStuffTableView: UITableView!
    
    
    // MARK: - Variables
    
    private var bayutViewModel            : BayutStuffViewModel!
    
    private var dataSource : BayutStuffTableViewDataSource<BayutStuffTableViewCell,StuffData>!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.intialSetup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = "Stuff List"
    }
    
    // MARK: - Custom Methods

    
    
    func intialSetup(){
        
        self.loaderSetting()
        self.navigationSetting()
        self.tableSetting()
        view.accessibilityIdentifier = "Onboarding View"
        
        bayutStuffTableView.accessibilityIdentifier = "Stuff-list"
     }
    
    func tableSetting(){
        callToViewModelForUIUpdate()
        bayutStuffTableView.delegate = self
        self.bayutStuffTableView.rowHeight        = 100
    }
    
    
    func navigationSetting(){
        
    self.title = "Stuff List"
       navigationController?.navigationBar.barTintColor = UIColor.white
       navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
         self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)
    }
    
    
    func loaderSetting(){
        DispatchQueue.main.async {
             
            let spinnerActivity                         = MBProgressHUD.showAdded(to: self.view, animated: true)

                    spinnerActivity.contentColor                = UIColor.cyan
                    spinnerActivity.bezelView.backgroundColor   = UIColor.clear
                    spinnerActivity.bezelView.color             = UIColor.clear
                    spinnerActivity.bezelView.tintColor         = UIColor.clear
                    spinnerActivity.bezelView.style             = .solidColor
 
         }
        
        }
    
    func callToViewModelForUIUpdate(){
        
        self.bayutViewModel =  BayutStuffViewModel()
        self.bayutViewModel.bindStuffViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = BayutStuffTableViewDataSource(cellIdentifier: "StuffTableViewCell", items: self.bayutViewModel.stuffData.results, configureCell: { (cell, svm) in
            cell.titleLabel.text = svm.name
            cell.subtitleLabel.text = svm.price
            let imageURl = (svm.imagethumbUrL[0])
            print(imageURl)
             cell.titleImageView.url(imageURl)
        })

        DispatchQueue.main.async {
            self.bayutStuffTableView.dataSource = self.dataSource
            self.bayutStuffTableView.reloadData()
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }
    }
    
    // MARK: -  TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let dataArray = self.bayutViewModel.stuffData.results
        let item = dataArray[indexPath.row]
        print(item.imageURL)
        self.moveToDetailViewController(item: item)
    }
    
    func moveToDetailViewController(item: StuffData){
        
        let storyboard       : UIStoryboard    =   UIStoryboard(name: "Main", bundle: nil)
        let bayutDetailsViewController = storyboard.instantiateViewController(withIdentifier: "BayutDetailsViewController") as! BayutDetailsViewController
            self.title = " "
        bayutDetailsViewController.stuffModel = item
            self.navigationController?.pushViewController(bayutDetailsViewController, animated: false)
    }
    

   
}
