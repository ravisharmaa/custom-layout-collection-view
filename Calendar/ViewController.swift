import UIKit

enum Days: Int {
    case S = 1, M, T, W, Th, F, Sat
}

class ViewController: UIViewController {
    
    
    private lazy var extendedView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let container = ContainerView()
        return container
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView()
        
        line.backgroundColor = UIColor.gray
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    private var labelsArray:[UILabel] = []
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configureExtendedView()
        configureContainerView()
        
        configureStackView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // need to setup these values to reset the default behavior of the navigation bar which is overriden
        // in configureExtendedView()
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
        
        navigationController?.navigationBar.layoutIfNeeded()
        
    }
    
    
    func configureExtendedView() {
        
        // removes the translucent property of navigation bar
        navigationController?.navigationBar.isTranslucent = false
        
        // remove the thin line of the navigation bar
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        navigationController?.navigationBar.layoutIfNeeded()
        
        view.addSubview(extendedView)
        view.addSubview(lineView)
        
        extendedView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        NSLayoutConstraint.activate([
            extendedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            extendedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            extendedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            extendedView.heightAnchor.constraint(equalToConstant: 25),
            
            
            lineView.leadingAnchor.constraint(equalTo: extendedView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: extendedView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: extendedView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func configureContainerView() {
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: extendedView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func configureStackView() {
        
        for i in 1...7 {
            let label = UILabel()
            label.text = "\(Days.init(rawValue: i)!)"
            label.textColor = UIColor.red
            
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
        
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        
        stackView.spacing = 24
        
        extendedView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: extendedView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: extendedView.trailingAnchor, constant: -16)
        ])
        
        
    }
    
    
}

