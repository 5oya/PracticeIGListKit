import Foundation
import IGListKit

class User {
    let id: Int
    let nickname: String


    init(id: Int, nickname: String) {
        self.id = id
        self.nickname = nickname
    }

}

// MARK: IGListDiffable
extension User: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let user = object as? User else { return false }
        
        return id == user.id
    }

}
