//
//  SelectTokenViewController.swift
//  AlphaWallet
//
//  Created by Vanila Tech Bibhut on 9/12/22.
//

import UIKit

protocol TokenSelectDelegate {
    func didSelectTokenFrom(tokenName: String)
    func didSelectTokenTo(tokenName: String)
}

class TokenSelectViewController: UIViewController {
    
    static func instantiate() -> TokenSelectViewController {
        return UIStoryboard(name: "SwapDummy", bundle: nil).instantiateViewController(withIdentifier: String(describing: TokenSelectViewController.self)) as! TokenSelectViewController
    }
    
    @IBOutlet weak var mainView: UIView!{
        didSet{
            mainView.layer.borderWidth = 1
            mainView.layer.borderColor = Colors.darkBlue.cgColor
            mainView.layer.cornerRadius = 10
            mainView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var tokenTblView: UITableView! {
        didSet{
            tokenTblView.dataSource = self
            tokenTblView.delegate = self
        }
    }
    
    @IBOutlet weak var txtSearch: UITextField!{
        didSet{
            txtSearch.layer.cornerRadius = 10
            txtSearch.layer.borderWidth = 1
            txtSearch.layer.borderColor = Colors.appWhite.cgColor
            txtSearch.delegate = self
        }
    }
    var tokenList = ["FTM", "AVAX", "BASED", "BNB", "BSHARE", "CRV", "DAI", "FUSD", "FUSDT", "L3USD", "LIF3", "LINK", "LSHARE", "MAI", "MIM", "SCREAM", "TBOND", "TREEB", "TSHARE", "USDC"]
    
    var filteredData = [String]()
    var delegate: TokenSelectDelegate?
    
    var isTokenFrom = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapCross(_ sender: Any) {
        self.dismiss(animated: false)
    }
    

    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
}


extension TokenSelectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = tokenList[indexPath.row]
        if self.isTokenFrom {
            self.dismiss(animated: false, completion: {
                self.delegate?.didSelectTokenFrom(tokenName: name)
            })
        } else {
            self.dismiss(animated: false, completion: {
                self.delegate?.didSelectTokenTo(tokenName: name)
            })
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return tokenList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TokenTableViewCell", for: indexPath) as! TokenTableViewCell
        if !filteredData.isEmpty {
            cell.lblTokenName.text = filteredData[indexPath.row]
        } else {
            cell.lblTokenName.text = tokenList[indexPath.row]
        }
        cell.contentView.backgroundColor = .clear
        return cell
    }
}

extension TokenSelectViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        if let text = textField.text {
//            filterText(text + string)
//        }
//        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let text = textField.text {
            filterText(text )
        }
    }
    
    
    
    
    func filterText(_ query: String?){
        guard let query = query else {
            return
        }
        
        filteredData.removeAll()
        for string in tokenList{
            if string.lowercased().starts(with: query.lowercased()){
                filteredData.append(string)
            }
        }
        tokenTblView.reloadData()
    }
}
