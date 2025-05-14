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
	private var cancellables = Set<AnyCancellable>()

	init() {
		memo = repository.load_memo()
	}

	func append_memo(content: MemoEntity) {
		memo.append(content)
		repository.save_memo(memo)
	}
}
