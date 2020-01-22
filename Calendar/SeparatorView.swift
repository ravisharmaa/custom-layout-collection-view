import UIKit

class SeparatorView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        self.frame = layoutAttributes.frame
    }
}
