import Foundation
import IGListKit

final class Photo {
    let id: String
    let user: User
    let image: UIImage
    
    
    init(id: String, user: User, image: UIImage) {
        self.id = id
        self.user = user
        self.image = image
    }
    
}

// MARK: ListDiffable
extension Photo: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let photo = object as? Photo else { return false }
        
        return id == photo.id
    }
    
}

