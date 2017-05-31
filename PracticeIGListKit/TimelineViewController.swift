import UIKit
import IGListKit

final class TimelineNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

final class TimelineViewController: UIViewController {
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    private let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    var data = SampleData.createInitialDataSet()


    override func loadView() {
        super.loadView()

//        view.backgroundColor = UIColor.orange
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "IGListKit"

        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds
    }

}


// MARK: IGListAdapterDataSource
extension TimelineViewController: IGListAdapterDataSource {

    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return [
            UserHistory(users: [
                User(id: 6, nickname: "soya"),
                User(id: 7, nickname: "gen"),
                User(id: 8, nickname: "kyoka"),
                User(id: 7, nickname: "kaneko"),
                User(id: 7, nickname: "yukke"),
                User(id: 7, nickname: "rina")
            ]),
            RecommendFeed(),
            Feed(id: UUID().uuidString, user: User(id: 1, nickname: "soya"), comment: "はい...", image: UIImage(named: "cat1.jpg")!),
            Feed(id: UUID().uuidString, user: User(id: 2, nickname: "soya"), comment: "おっさんそば食えや", image: UIImage(named: "cat2.jpg")!),
            PhotoList(photos: [
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat1.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog1.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat2.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog2.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat3.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog3.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat1.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog1.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat2.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog2.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "cat3.jpg")!),
                Photo(id: UUID().uuidString, user: User(id: 7, nickname: "kaneko"), image: UIImage(named: "dog3.jpg")!),
            ], itemCount: 12)
        ] as [IGListDiffable]
    }

    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        switch object {
        case is UserHistory:   return UserHistorySectionController()
        case is RecommendFeed: return RecommendFeedSectionController()
        case is PhotoList:     return PhotoListSectionController()
        default:               return FeedSectionController()
        }
    }

    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }

}
