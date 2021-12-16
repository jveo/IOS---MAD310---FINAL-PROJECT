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
        
        /*
        
         const urlString is the json location of the data
         
         if that url string is valid
         proceed ro parse the contents of the json url with the parseJson() function below
         
         
         */
        let urlString = "https://dtakaki.scweb.ca/mad310/version3Data.json"
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parseJson(json: data)
            }
        }
    }

    
    func parseJson(json: Data){
        
        //intantiate the decoder
        let decoder = JSONDecoder()
        
        // if jsonCompaies == true then proceed to make the companies array the parsed json results
        if let jsonCompanies = try? decoder.decode(Companies.self, from:json){
            companies = jsonCompanies.results
            tableView.reloadData()
        }
    }
    
    
    //returning the number of results
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    
    /* tableView function returning a UITableViewCell to display the information
     
     
     
     */
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

