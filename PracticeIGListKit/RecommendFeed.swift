import Foundation
import IGListKit

class RecommendFeed {
    let id: String
    let text: String

    
    init() {
        self.id = "recommend"
        self.text = "広告"
    }

}

extension RecommendFeed: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return "recommend" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? RecommendFeed else { return false }
        return id == object.id
    }
    
}
