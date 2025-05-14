//
//  MemoRepository.swift
//  Memo_app
//
//  Created by seongjun cho on 5/14/25.
//

import Foundation

class MemoRepository: MemoProtocol {
	func save_memo(_ memo_array: MemoEntity) {
		do {
			let data = try JSONEncoder().encode(memo_array)

			UserDefaults.standard.set(data, forKey: "memo")
		}
		catch {
			print("Encoding error :", error)
		}
	}
	
	func load_memo() -> [MemoEntity] {
		if let data = UserDefaults.standard.data(forKey: "memo") {
			do {
				let loaded_memo = try JSONDecoder().decode([MemoEntity].self, from: data)

				print(loaded_memo)

				return loaded_memo
			} catch {
				print("Decoding error :", error)
			}
		}

		// memo is nil
		print("Alert : memo is nil")

		return []
	}
	

}

protocol MemoProtocol {
	func save_memo(_ memo_array: MemoEntity)
	func load_memo() -> [MemoEntity]
}
