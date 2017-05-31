import Foundation
import IGListKit

final class PhotoListSectionController: IGListSectionController, IGListSectionType {
    private var photoList: PhotoList?
    
    
    override init() {
        super.init()
        
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
    }
    
    func numberOfItems() -> Int {
        return photoList?.itemCount ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = floor(width / 3)
        
        return CGSize(width: itemSize - 1, height: itemSize - 1)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "PhotoCell", bundle: nil, for: self, at: index) as? PhotoCell else {
            fatalError()
        }
        cell.imageView.image = photoList?.photos[index].image
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.photoList = object as? PhotoList
    }
    
    func didSelectItem(at index: Int) {
        print("selected PhotoListSection")
    }
    
}
