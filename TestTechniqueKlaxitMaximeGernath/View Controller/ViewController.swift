//
//  ViewController.swift
//  TestTechniqueKlaxitMaximeGernath
//
//  Created by Maxime Gernath on 15/01/2022.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var adresses: [Adress] = []
    var selectedItem: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adresses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let address = adresses[indexPath.row]
        cell.textLabel?.text = address.adress_details.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = adresses[indexPath.row].adress_details.name
        return indexPath
    }
    
    // Save the new dataModel with KeychainStorage before leaving the page
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let presenter = presentingViewController as? ProfilViewController {
            presenter.userInfo.adress = selectedItem
            if KeychainStorage.saveuserinfo(presenter.userInfo) {
                print("user info saved")
            } else {
                print("fail to save user info")
            }
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let adressName = searchBar.text else { return }

        if adressName != "" {
            getAutoCompletedAdresses(for: adressName)
            tableView.reloadData()
        }
        
    }
}

extension ViewController {
    // Get the data with the help of Alamofire
    func getAutoCompletedAdresses(for adress: String) {
        let url = "https://api-adresse.data.gouv.fr/search"
        let parameters: [String: String] = ["q": adress, "limit": "15"]

        AF.request(url,parameters: parameters)
            .validate()
            .responseDecodable(of: AdressList.self) { response in
                guard let adresses = response.value else { return }
                self.adresses = adresses.adresses
                self.tableView.reloadData()
            }
    }
}
