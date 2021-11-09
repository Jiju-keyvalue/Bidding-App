//
//  MyBidsViewController.swift
//  Bidding App
//
//  Created by jiju on 02/11/21.
//
import SideMenu
import UIKit

class MyBidsViewController: UIViewController {

    private let sideMenu = SideMenuNavigationController(rootViewController: MenuListController())
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true, completion: nil)
    }

}
