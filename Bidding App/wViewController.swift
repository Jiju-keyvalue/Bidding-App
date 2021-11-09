//
//  wViewController.swift
//  Bidding App
//
//  Created by jiju on 01/11/21.
//

import UIKit

class wViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
//        setNavigationBar()
        self.navigationItem.title = "First VC"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(done))
        
        // Do any additional setup after loading the view.
    }
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "gfrgg")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)// remove @objc for Swift 3

    }

    @IBAction func ghtrey(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
