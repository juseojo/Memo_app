//
//  MemoView.swift
//  Memo_app
//
//  Created by seongjun cho on 5/14/25.
//

import UIKit

import SnapKit

class MemoView: UIView {
	let write_button: UIButton = {
		let button = UIButton()

		button.setTitle("+", for: .normal)
		button.setTitleColor(.black, for: .normal)

		return button
	}()

	let memo_tableView: UITableView = {
		let tableView = UITableView()
		
		return tableView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		addSubview(write_button)
		addSubview(memo_tableView)

		self.backgroundColor = .white
		// layout
		write_button.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
			make.trailing.equalToSuperview().inset(16)
			make.width.height.equalTo(44)
		}

		memo_tableView.snp.makeConstraints { make in
			make.top.equalTo(write_button.snp.bottom)
			make.leading.trailing.bottom.equalToSuperview()
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
