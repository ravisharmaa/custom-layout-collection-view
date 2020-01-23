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
    }
    
    func configure() {
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45)
        ])
    }
    
    func configureStackView() {
        for i in 1...7 {
            let label = UILabel()
            label.text = "\(Days.init(rawValue: i)!)"
            stackView.addArrangedSubview(label)
        }
        
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 26
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.superview?.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.superview?.addConstraints([
           NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: stackView.superview, attribute: .leading, multiplier: 0, constant: 0),
            NSLayoutConstraint.init(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: stackView.superview, attribute: .trailing, multiplier: 0, constant: 0)
        ])

        navigationItem.titleView = stackView
    }


}

