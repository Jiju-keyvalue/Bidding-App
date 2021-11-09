//
//  ProductModel.swift
//  Bidding App
//
//  Created by jiju on 02/11/21.
//

import Foundation
import UIKit

//struct ProductModel: Codable {
//    var productId: Int
//    var productName: String
//    var marketPrice: Int
//    var recommendation: Int
//    var noOfBids: Int
//    var productExpiry: Int
//    var productCategory: Int
//    var currentBidder: [CurrentBidder]
//    var productImages: [String]
//}
struct CurrentBidder: Codable {
    var amount: Double
    var name: String
    var profileImage: String
}
