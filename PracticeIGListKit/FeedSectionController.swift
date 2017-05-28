import Foundation
import IGListKit

final class FeedSectionController: IGListSectionController, IGListSectionType {
    private var feed: Feed?


    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { return .zero }

        return CGSize(width: width, height: 100)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else { fatalError("feed is nil.") }

        let cell = collectionContext?.dequeueReusableCell(withNibName: "FeedCell", bundle: nil, for: self, at: index) as! FeedCell
        cell.commentLabel?.text = "\(feed.user.nickname)さんが「\(feed.comment)」とコメントしました"
        cell.imageView?.image = feed.image

        return cell
    }
    
    func didUpdate(to object: Any) {
        feed = object as? Feed
    }

    func didSelectItem(at index: Int) {
        print("selected FeedSection")
    }

}
