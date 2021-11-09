//
//  aViewController.swift
//  Bidding App
//
//  Created by jiju on 01/11/21.
//

import UIKit

class aViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Firwdwdst VC"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(done))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(done))
        // Do any additional setup after loading the view.
    }
    
    @objc func done() {
        
    }
    @IBAction func ffddfs(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "wViewController") as! wViewController
        newViewController.modalPresentationStyle = .fullScreen
//        newViewController.modalTransitionStyle = .crossDissolve
//        newViewController.delegate = self
        self.navigationController?.pushViewController(newViewController, animated: true)
//        self.present(newViewController, animated: true, completion: nil)
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
