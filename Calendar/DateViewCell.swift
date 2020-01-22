import UIKit

class DateViewCell: UICollectionViewCell {
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
}
