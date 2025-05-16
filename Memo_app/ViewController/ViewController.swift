//
//  ViewController.swift
//  Memo_app
//
//  Created by seongjun cho on 5/14/25.
//

import UIKit

import Combine

class ViewController: UIViewController {

	let memo_view = MemoView()
	let memo_viewModel = MemoViewModel()
	private var cancellables = Set<AnyCancellable>()

	override func loadView() {
		view = memo_view
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		// Data binding
		memo_viewModel.$memo
			.receive(on: DispatchQueue.main)
			.sink { [weak self] items in
				self?.memo_view.memo_tableView.reloadData()
				print("fetch")
			}
			.store(in: &cancellables)

		// Table view setting
		memo_view.memo_tableView.dataSource = self
		memo_view.memo_tableView.delegate   = self
		memo_view.memo_tableView.rowHeight  = 50
		memo_view.memo_tableView.register(Memo_tableView_cell.self, forCellReuseIdentifier: Memo_tableView_cell.identifier)
		memo_view.write_button.addTarget(self, action: #selector(tap_add_memo), for: .touchUpInside)
	}

	// event handler
	@objc func tap_add_memo() {
		let alertController = UIAlertController(title: "memo", message: "", preferredStyle: .alert)
		
		alertController.addTextField { (textField) in
			textField.placeholder = "memo text"
		}
		
		alertController.addAction(UIAlertAction(title: "OK", style: .default) { (_) in

			self.memo_viewModel.append_memo(text: alertController.textFields![0].text ?? "")
		})

		present(alertController, animated: false)
	}
}

// Tableview setting
extension ViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.memo_viewModel.memo.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Memo_tableView_cell.identifier, for: indexPath) as! Memo_tableView_cell

		cell.configure(with: self.memo_viewModel.memo[indexPath.row].text)

		return cell
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		let deleting_id = self.memo_viewModel.memo[indexPath.row].id

		self.memo_viewModel.delete_memo(id: deleting_id)
	}
}
