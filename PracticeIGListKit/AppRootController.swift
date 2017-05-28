import UIKit
import SnapKit

final class AppRootController: UIViewController {
    private lazy var appTabBarController: AppTabBarController = { AppTabBarController() }()


    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(appTabBarController)
        view.addSubview(appTabBarController.view)
        appTabBarController.view.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

}
