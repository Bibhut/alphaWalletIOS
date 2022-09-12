//
//  MarketViewController.swift
//  AlphaWallet
//
//  Created by Vanila Tech Bibhut on 9/12/22.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet weak var toView: UIView!{
        didSet{
            toView.layer.cornerRadius = 20
            toView.layer.masksToBounds = true
            toView.layer.borderWidth = 1
            toView.layer.borderColor = Colors.darkBlue.cgColor
        }
    }
    
    @IBOutlet weak var fromView: UIView!{
        didSet{
            fromView.layer.borderWidth = 1
            fromView.layer.borderColor = Colors.darkBlue.cgColor
            fromView.layer.cornerRadius = 20
            fromView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var btnConnectWallet: UIButton!{
        didSet{
            btnConnectWallet.layer.cornerRadius = 20
            btnConnectWallet.layer.masksToBounds = true
            
        }
    }
    @IBOutlet weak var lblTokenFrom: UILabel!
    
    @IBOutlet weak var lblTokenTo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapFrom(_ sender: Any) {
        let controller = TokenSelectViewController.instantiate()
        controller.delegate = self
        controller.isTokenFrom = true
        self.present(controller, animated: false)
    }
    
    @IBAction func didTapTo(_ sender: Any) {
        let controller = TokenSelectViewController.instantiate()
        controller.delegate = self
        controller.isTokenFrom = false
        self.present(controller, animated: false)
    }
    

}

extension MarketViewController: TokenSelectDelegate {
    
    func didSelectTokenFrom(tokenName: String) {
        lblTokenFrom.text = tokenName
    }
    
    func didSelectTokenTo(tokenName: String) {
        lblTokenTo.text = tokenName
    }
    
    
    
}
