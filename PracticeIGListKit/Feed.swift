import Foundation
import IGListKit

class Feed {
    let id: String
    let user: User
    let comment: String
    let image: UIImage


    init(id: String, user: User, comment: String, image: UIImage) {
        self.id = id
        self.user = user
        self.comment = comment
        self.image = image
    }

}

// MARK: IGListDiffable
extension Feed: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let feed = object as? Feed else { return false }

        return id == feed.id
    }

}
