# UIKit Previewable Views
 This repository makes your existing UIView & UIViewControllers quickly preview provider usable.

## Demo Usage
```swift
#if DEBUG
@available(iOS 13.0, *)
final class TestViewController: UIViewController, PreviewableProtocol {
    private let labelTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabel()
    }
    
    private func prepareLabel() {
        configureLabel()
        addLabel()
    }
    
    // Configuration
    private func configureLabel() {
        labelTitle.text = "Label Text"
        labelTitle.textColor = .red
        labelTitle.font = .boldSystemFont(ofSize: 30)
    }
    
    // Constraints
    private func addLabel() {
        view.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

@available(iOS 13.0, *)
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        TestViewController.preview
    }
}
#endif
```
