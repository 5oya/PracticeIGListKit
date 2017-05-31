import Foundation
import IGListKit

final class PhotoList {
    let photos: [Photo]
    let itemCount: Int
    
    init(photos: [Photo], itemCount: Int) {
        self.photos = photos
        self.itemCount = itemCount
    }
    
}

// MARK: ListDiffabel
extension PhotoList: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        guard let photoList = self as? NSObjectProtocol else { fatalError() }
        
        return photoList
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(toDiffableObject: object)
    }
    
}
