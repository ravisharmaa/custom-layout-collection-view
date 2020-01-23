import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        register(SeparatorView.self, forDecorationViewOfKind: "separtator")
        minimumLineSpacing = 0.3
        minimumInteritemSpacing = 0.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect) ?? []
        
        
        let minimumWidth = self.minimumLineSpacing
        
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        
        // loops through each item and defice a separator view for that item
        
        for layoutAttribute in layoutAttributes //where layoutAttribute.indexPath.item > 6 {
        {
            let separatorAttribute = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "separtator", with: layoutAttribute.indexPath)
            let cellFrame = layoutAttribute.frame
            separatorAttribute.frame = CGRect(x: cellFrame.origin.x,
                                              y: cellFrame.origin.y - minimumWidth,
                                              width: cellFrame.size.width,
                                              height: minimumWidth)
            separatorAttribute.zIndex = Int.max
            decorationAttributes.append(separatorAttribute)
        }
        
        
        return layoutAttributes + decorationAttributes
        
    }
}
