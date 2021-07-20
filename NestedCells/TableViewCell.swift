//
//  TableViewCell.swift
//  NestedCells
//
//  Created by Rahul Dhiman on 20/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var icon: UIImageView!
	
	@IBOutlet var leading: NSLayoutConstraint!

	func configure(title: String, expanded: Bool = false, leading: CGFloat = 10.0, hideIcon:Bool) {
		self.title.text = title
		if hideIcon {
			icon.image = UIImage(systemName: "clear")
		} else {
			icon.image = expanded ?
				UIImage(systemName: "chevron.down.circle") :
				UIImage(systemName: "chevron.right.circle")
		}
		
		self.leading.constant = leading
		
	}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
