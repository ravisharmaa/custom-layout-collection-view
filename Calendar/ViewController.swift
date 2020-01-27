import UIKit

enum Days: Int {
    case S = 1, M, T, W, Th, F, Sat
}

class ViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let container = ContainerView()
        return container
    }()
    
    var labelsArray:[UILabel] = []
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configure()
        
        configureStackView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("hi")
        } else {
            print("bi")
        }
    }
    
    func configure() {
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func configureStackView() {
        for i in 1...7 {
            let label = UILabel()
            label.text = "\(Days.init(rawValue: i)!)"
            
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
        
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        
        stackView.spacing = 26
  
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.superview?.translatesAutoresizingMaskIntoConstraints = false
    
        navigationItem.titleView = stackView
        
        
    }
    
    
}

