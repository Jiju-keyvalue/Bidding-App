//
//  AuctionDetailViewController.swift
//  Bidding App
//
//  Created by jiju on 02/11/21.
//

import UIKit

class AuctionDetailViewController: UIViewController {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var marketPriceLabel: UILabel!
    @IBOutlet var noOfBidsLabel: UILabel!
    @IBOutlet var noOfRecommendsLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var makeABidButton: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var goButton: UIButton!
    
    var ed = 3
    var item = ProductItem()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    private var models = [Bidder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BidsTableViewCell", bundle: nil),forCellReuseIdentifier: "BidsTableViewCell")
        self.navigationController?.isNavigationBarHidden = true
        loadData()
//        self.navigationItem.title = ""
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(done))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(done))
    }
    
    func loadData() {
        productImageView.image = UIImage(named: item.productImages?[0] ?? "default_img")
        productName.text = item.productName
        starsLabel.text = "3 stars"
        marketPriceLabel.text = "\(item.marketPrice)"
        noOfBidsLabel.text = "\(item.noOfBids)"
        noOfRecommendsLabel.text = "\(item.recommendation)"
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
    
    //CoreData
    
    func updateItem(item: ProductItem, newAmt: Double) {
        item.currentBidderAmt = newAmt
        do {
            try context.save()
        }
        catch{
            
        }
    }
    
    @IBAction func onClickMakeABid(_ sender: Any) {
        makeABidButton.isHidden = true
    }
    
    @IBAction func onClickGo(_ sender: Any) {
        guard let field = textField.text, !field.isEmpty else {
            return
        }
        if let newAmt = Double(field), newAmt < item.currentBidderAmt {
            if let count = UserDefaults.standard.value(forKey: "bidCount") as? Int {
                if count < 5 {
                    updateItem(item: item, newAmt: newAmt)
                    UserDefaults.standard.set(count+1, forKey: "bidCount")
                }else{
                    let alert = UIAlertController(title: "Alert", message: "Please Upgrade your plan", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            }else{
                updateItem(item: item, newAmt: newAmt)
                UserDefaults.standard.set(1, forKey: "bidCount")
            }
            tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Alert", message: "Enter a lower amount", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AuctionDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BidsTableViewCell", for: indexPath) as! BidsTableViewCell
        cell.personName.text = item.currentBidderName
        cell.personImage.image = UIImage(named: item.currentBidderImage ?? "default_img")
        cell.bidAmt.text = "\(item.currentBidderAmt)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
