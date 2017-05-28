import Foundation
import IGListKit

final class RecommendFeedSectionController: IGListSectionController, IGListSectionType {
    private var feed: RecommendFeed?
    
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { return .zero }
        
        return CGSize(width: width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil.") }
        
        let cell = collectionContext?.dequeueReusableCell(withNibName: "RecommendFeedCell", bundle: nil, for: self, at: index) as! RecommendFeedCell
        cell.textLabel?.text = feed.text
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        feed = object as? RecommendFeed
    }
    
    func didSelectItem(at index: Int) {
        print("selected RecommendFeedSection")
    }

}
