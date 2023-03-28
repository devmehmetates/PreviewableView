import SwiftUI

@available(iOS 13.0, *)
protocol PreviewableProtocol {}

@available(iOS 13.0, *)
extension PreviewableProtocol where Self: UIViewController {
    static var preview: some View {
        GenericUIViewControllerRepresentable { _ in
            Self()
        }
    }
}

@available(iOS 13.0, *)
extension PreviewableProtocol where Self: UIView {
    static var preview: some View {
        GenericUIViewRepresentable { _ in
            Self()
        }
    }
}

@available(iOS 13.0, *)
struct GenericUIViewRepresentable<ViewType>: UIViewRepresentable where ViewType: UIView {
    func updateUIView(_ uiView: ViewType, context: Context) { }
    let factory: (Context) -> ViewType
    func makeUIView(context: Context) -> ViewType { factory(context) }
}

@available(iOS 13.0, *)
struct GenericUIViewControllerRepresentable<ViewControllerType>: UIViewControllerRepresentable where ViewControllerType: UIViewController {
    func updateUIViewController(_ uiViewController: ViewControllerType, context: Context) { }
    let factory: (Context) -> ViewControllerType
    func makeUIViewController(context: Context) -> ViewControllerType { factory(context) }
}


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
