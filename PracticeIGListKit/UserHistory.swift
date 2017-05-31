import Foundation
import IGListKit

class UserHistory {
    let id: String
    let users: [User]


    init(users: [User]) {
        self.id = "userHistory"
        self.users = users
    }
}

// MARK: IGListDiffable
extension UserHistory: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? UserHistory else { return false }
        
        return id == object.id
    }

}
