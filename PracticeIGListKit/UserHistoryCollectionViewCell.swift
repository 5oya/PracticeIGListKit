import UIKit
import IGListKit

final class UserHistoryCollectionViewCell: UICollectionViewCell {
    private lazy var separator: CALayer = {
        let layer = CALayer()
        self.contentView.layer.addSublayer(layer)
        return layer
    }()
    
    lazy var collectionView: IGListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = IGListCollectionView(frame: .zero, collectionViewLayout: layout)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = contentView.bounds
        let height = CGFloat(0.5)
        let left = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15).left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width, height: height)
        separator.backgroundColor = UIColor(red: 200 / 255.0, green: 199 / 255.0, blue: 204 / 255.0, alpha: 1).cgColor
        
        collectionView.frame = contentView.frame
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = true
    }

}
