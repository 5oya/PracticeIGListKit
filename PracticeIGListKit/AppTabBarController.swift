import UIKit

final class AppTabBarController: UITabBarController {
    private lazy var timelineViewController: TimelineViewController = { TimelineViewController() }()
    private lazy var timelineNavigationController: TimelineNavigationController = { TimelineNavigationController(rootViewController: self.timelineViewController) }()


    override func viewDidLoad() {
        super.viewDidLoad()

        timelineNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)

        let viewControllers: [UIViewController] = [
            timelineNavigationController
        ]
        setViewControllers(viewControllers, animated: false)
    }

}
