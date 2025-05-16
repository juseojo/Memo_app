//
//  MemoViewModel.swift
//  Memo_app
//
//  Created by seongjun cho on 5/14/25.
//

import Foundation

import Combine

class MemoViewModel {
	@Published var memo: [MemoEntity] = []
	private var repository = MemoRepository()

	init() {
		memo = repository.load_memo()
	}

	func append_memo(text: String) {
		let new_memo = MemoEntity(id: (memo.last?.id ?? 0) + 1, text: text)

		memo.append(new_memo)
		repository.save_memo(memo)
	}

	func delete_memo(id: Int) {
		memo.removeAll { $0.id == id }
		repository.save_memo(memo)
	}
}
