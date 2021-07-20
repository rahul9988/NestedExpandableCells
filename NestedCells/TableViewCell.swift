//
//  TableViewCell.swift
//  NestedCells
//
//  Created by Rahul Dhiman on 20/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {
	@IBOutlet weak var title: UILabel!
	
	func configure(title: String) {
		self.title.text = title
	}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
