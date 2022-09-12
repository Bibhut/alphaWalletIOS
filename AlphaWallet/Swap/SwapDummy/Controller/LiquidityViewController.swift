//
//  LiquidityViewController.swift
//  AlphaWallet
//
//  Created by Vanila Tech Bibhut on 9/12/22.
//

import UIKit

class LiquidityViewController: UIViewController {

    @IBOutlet weak var btnAddLiquidity: UIButton!{
        didSet{
            btnAddLiquidity.layer.cornerRadius = 20
            btnAddLiquidity.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var viewConnectWallet: UIView!{
        didSet{
            viewConnectWallet.layer.cornerRadius = 20
            viewConnectWallet.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
