import UIKit


class ViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let container = ContainerView()
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configure()
    }
    
    func configure() {
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2)
        ])
    }


}

