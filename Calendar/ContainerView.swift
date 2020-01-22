import UIKit

class ContainerView: UIView {
    
    let insets:CGFloat = 10
    
    let itemsPerRow: CGFloat = 7
    
    let spacing: CGFloat = 0
    
    lazy var collectionView: UICollectionView = {
        
        let layout = CustomLayout()
        
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(DateViewCell.self, forCellWithReuseIdentifier: "reuseId")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    
}

extension ContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseId", for: indexPath) as? DateViewCell
        
        cell?.dateLabel.text = "\(indexPath.row + 1) "
        
        return cell!
    }
    
    
}

extension ContainerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableWidth = ((self.frame.size.width - (2 * insets) - (spacing * (itemsPerRow - 1)))) / itemsPerRow
        
        return CGSize(width: availableWidth, height: availableWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    
}


