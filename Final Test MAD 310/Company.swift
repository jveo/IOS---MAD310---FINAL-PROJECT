//
//  petition.swift
//  Final Test MAD 310
//
//  Created by Jesse viau on 2021-12-14.
//

import Foundation

/* Creating Custome type called "Company"
 
 required fields:
     var companyName: String
     var dunsNumber: String
     var companyAddress: String
     var city: String
     var contactName: String
     var contactEmail: String
     var contactPhone: String
     var product: String
 
 */

struct Company: Codable {
    var companyName: String
    var dunsNumber: String
    var companyAddress: String
    var city: String
    var contactName: String
    var contactEmail: String
    var contactPhone: String
    var product: String
    
}
