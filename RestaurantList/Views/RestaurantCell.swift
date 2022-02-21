//
//  RestaurantCell.swift
//  RestaurantList
//
//  Created by Jonathan Go on 21.02.22.
//

import Foundation
import UIKit

final class RestaurantCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
