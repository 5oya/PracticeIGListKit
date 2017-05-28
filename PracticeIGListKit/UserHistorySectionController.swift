import Foundation
import IGListKit

final class UserHistorySectionController: IGListSectionController, IGListSectionType {
    var userHistory: UserHistory?
    private lazy var adapter: IGListAdapter = {
       let adapter = IGListAdapter(updater: IGListAdapterUpdater(), viewController: self.viewController, workingRangeSize: 0)
        adapter.dataSource = self
        return adapter
    }()

    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { return .zero }
        
        return CGSize(width: width, height: 90)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: UserHistoryCollectionViewCell.self, for: self, at: index) as! UserHistoryCollectionViewCell
        adapter.collectionView = cell.collectionView
        
        return cell
    }

    func didUpdate(to object: Any) {
        userHistory = object as? UserHistory
    }
    
    func didSelectItem(at index: Int) {
        print("selected UserHistorySection")
    }

}

// MARK: IGListAdapterDataSource
extension UserHistorySectionController: IGListAdapterDataSource {
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return (userHistory?.users)!
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return UserSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    
}
