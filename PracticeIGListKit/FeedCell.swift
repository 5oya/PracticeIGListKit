import UIKit

final class FeedCell: UICollectionViewCell {
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    private lazy var separator: CALayer = {
        let layer = CALayer()
        self.contentView.layer.addSublayer(layer)
        return layer
    }()

    override var isHighlighted: Bool {
        didSet {
            contentView.backgroundColor = UIColor(white: isHighlighted ? 0.9 : 1, alpha: 1)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let bounds = contentView.bounds
        let height = CGFloat(0.5)
        let left = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15).left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width - left, height: height)
        separator.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
    }

}
