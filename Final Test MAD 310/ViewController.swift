//
//  ViewController.swift
//  Final Test MAD 310
//
//  Created by Jesse viau on 2021-12-14.
//

import UIKit

class ViewController: UITableViewController {

    var companies = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://dtakaki.scweb.ca/mad310/version3Data.json"
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parseJson(json: data)
            }
        }
    }

    func parseJson(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonCompanies = try? decoder.decode(Companies.self, from:json){
            companies = jsonCompanies.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let company = companies[indexPath.row]
        cell.textLabel?.text = company.product
        cell.detailTextLabel?.text = "Company: \(company.companyName)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = companies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

