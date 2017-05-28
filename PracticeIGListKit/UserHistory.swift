import Foundation
import IGListKit

class UserHistory {
    let identifier: String
    let users: [User]


    init(users: [User]) {
        self.identifier = "userHistory"
        self.users = users
    }
}

// MARK: IGListDiffable
extension UserHistory: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? UserHistory else { return false }
        
        return identifier == object.identifier
    }

}
