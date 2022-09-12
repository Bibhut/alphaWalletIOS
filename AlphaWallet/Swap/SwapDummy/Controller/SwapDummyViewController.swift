//
//  SwapDummyViewController.swift
//  AlphaWallet
//
//  Created by Vanila Tech Bibhut on 9/12/22.
//

import UIKit

class SwapDummyViewController: UIViewController {
    
    
    // MARK: - Constants
    static func instantiate() -> SwapDummyViewController {
        return UIStoryboard(name: "SwapDummy", bundle: nil).instantiateViewController(withIdentifier: String(describing: SwapDummyViewController.self)) as! SwapDummyViewController
    }

    @IBOutlet weak var swapContainerView: UIView! {
        didSet{
            swapContainerView.layer.cornerRadius = 20
            swapContainerView.layer.masksToBounds = true
            swapContainerView.layer.borderWidth = 1
            swapContainerView.layer.borderColor = Colors.darkBlue.cgColor
            
        }
    }
    @IBOutlet weak var liquidityContainerView: UIView!{
        didSet{
            liquidityContainerView.layer.cornerRadius = 20
            liquidityContainerView.layer.masksToBounds = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func didTapSegmentControl(_ sender: UISegmentedControl) {
        swapContainerView.isHidden = true
        liquidityContainerView.isHidden = true
        //swap case
        if sender.selectedSegmentIndex == 0 {
            swapContainerView.isHidden = false
        } else {
            liquidityContainerView.isHidden = false
        }
    }
    
}
