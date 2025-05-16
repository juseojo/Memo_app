//
//  Memo_tableView_cell.swift
//  Memo_app
//
//  Created by seongjun cho on 5/15/25.
//

import UIKit

import SnapKit

class Memo_tableView_cell: UITableViewCell {

	static var identifier = "MemoCell"
	private let text_label = {
		let label = UILabel()

		label.font = .systemFont(ofSize: 17, weight: .regular)

		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		selectionStyle = .none
		separatorInset = .zero
		layoutMargins = .zero

		// layout
		addSubview(text_label)

		text_label.snp.makeConstraints { make in
			make.top.leading.equalToSuperview()
			make.bottom.equalToSuperview()
			make.trailing.equalToSuperview()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		text_label.text = nil
	}

	func configure(with text: String) {
		text_label.text = text
	}
}
