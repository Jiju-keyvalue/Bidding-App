//
//  HomeViewController.swift
//  Bidding App
//
//  Created by jiju on 02/11/21.
//
import SideMenu
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var searchView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuListController())
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [ProductItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        searchView.layer.masksToBounds = false
        searchView.layer.shadowOffset = CGSize(width: -1, height: 1)
        searchView.layer.shadowRadius = 0.5
        searchView.layer.shadowOpacity = 0.3
        searchView.layer.cornerRadius = searchView.bounds.size.height / 2
        collectionView.delegate = self
        collectionView.dataSource = self
        if !UserDefaults.standard.bool(forKey: "isItemsSavedToCoreData") {
            //first time
            addProductsToCoreData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllItems()
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true, completion: nil)
    }
    
    //CoreData
    func getAllItems() {
        do {
            models = try context.fetch(ProductItem.fetchRequest())
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        catch{
            
        }
    }
    
    func createItem(productName: String,productId: String,marketPrice: Int64, noOfBids: Int64, recommendation: Int64, productExpiry: Int64, productCategory: Int64, productImages: [String]?) {
        let newItem = ProductItem(context: context)
        newItem.productName = productName
        newItem.productId = productId
        newItem.marketPrice = marketPrice
        newItem.noOfBids = noOfBids
        newItem.recommendation = recommendation
        newItem.productExpiry = productExpiry
        newItem.productCategory = productCategory
        newItem.productImages = productImages
        
        newItem.currentBidderName = "jiju"
        newItem.currentBidderAmt = 0.6
        newItem.currentBidderImage = "person1"
        
        do {
            try context.save()
            getAllItems()
        }
        catch{
            
        }
    }

    func addProductsToCoreData() {
        createItem(productName: "IPhone", productId:  UUID().uuidString, marketPrice: 20000, noOfBids: 34, recommendation: 45, productExpiry: 3, productCategory: 4, productImages: ["iphone_img"])
        createItem(productName: "Speaker", productId:  UUID().uuidString, marketPrice: 1500, noOfBids: 22, recommendation: 5, productExpiry: 5, productCategory: 1, productImages: ["speaker_img"])
        createItem(productName: "Alexa", productId:  UUID().uuidString, marketPrice: 4500, noOfBids: 400, recommendation: 66, productExpiry: 2, productCategory: 2, productImages: ["alexa_img"])
        UserDefaults.standard.set(true, forKey: "isItemsSavedToCoreData")
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.productName.text = model.productName
        cell.productImage.image = UIImage(named: model.productImages?[0] ?? "default_img")
        cell.noOFBids.text = "\(model.noOfBids)Bids"
        cell.timeLabel.text = "\(model.productExpiry)hrs"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AuctionDetailViewController") as! AuctionDetailViewController
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.hidesBottomBarWhenPushed = true
        newViewController.item = models[indexPath.row]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
