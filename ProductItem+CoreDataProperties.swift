//
//  ProductItem+CoreDataProperties.swift
//  
//
//  Created by jiju on 08/11/21.
//
//

import Foundation
import CoreData


extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var currentBidderAmt: Double
    @NSManaged public var currentBidderImage: String?
    @NSManaged public var currentBidderName: String?
    @NSManaged public var marketPrice: Int64
    @NSManaged public var noOfBids: Int64
    @NSManaged public var productCategory: Int64
    @NSManaged public var productExpiry: Int64
    @NSManaged public var productId: String?
    @NSManaged public var productImages: [String]?
    @NSManaged public var productName: String?
    @NSManaged public var recommendation: Int64

}
