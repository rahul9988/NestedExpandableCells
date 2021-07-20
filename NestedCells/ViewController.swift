//
//  ViewController.swift
//  NestedCells
//
//  Created by Rahul Dhiman on 20/07/21.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	var datasource: [Human] = []
	var allChild = [Human]()

	override func viewDidLoad() {
		super.viewDidLoad()
		datasource.append(Human(name: "grandfather", children: [Human(name: "Ashok", children: [Human(name: "Rahul")])]))
		datasource.append(Human(name: "grandfather1", children: [Human(name: "Ashok1", children: [Human(name: "Rahul1")])]))

		getNestedObjects(from: datasource)
		tableView.reloadData()
	}

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	private func getNestedObjects(from array: [Human]) {
		for item in array {
			allChild.append(item)
			if item.children.isEmpty == false {
				getNestedObjects(from: item.children)
			}
		}
	}
	
	private func updateNestedObjects(from array: [Human]) {
		for item in array {
			allChild.append(item)
			if item.isExpanded {
				updateNestedObjects(from: item.children)
			}
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		allChild.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
		cell.configure(title: allChild[indexPath.row].name)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = allChild[indexPath.row]
		item.isExpanded = !item.isExpanded
		allChild.removeAll()
		updateNestedObjects(from: datasource)
		tableView.reloadData()
	}
}

class Human {
	internal init(name: String, children: [Human] = []) {
		self.name = name
		self.children = children
		self.isExpanded = true
	}
	
	var name: String
	var children: [Human] = []
	var isExpanded: Bool {
		set {
			if !children.isEmpty {
				_isExpanded = newValue
			}
		}
		get {
			if !children.isEmpty,
			   let _ = _isExpanded {
				return _isExpanded!
			} else {
				return false
			}
		}
	}
	private var _isExpanded: Bool? = nil
}
