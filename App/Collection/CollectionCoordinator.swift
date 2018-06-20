
import UIKit

private func COLLECTION_COORDINATOR_LOG(_ message: String)
{
    NSLog("CollectionCoordinator \(message)")
}

class CollectionCoordinator: Coordinator
{

    // MARK: - SETUP

    override init()
    {
        super.init()
        self.setupCollection()
    }

    // MARK: - COLLECTION

    private var collectionView: CollectionView!

    private func setupCollection()
    {
        self.collectionView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.collectionView)
        vc.title = NSLocalizedString("Collection.Title", comment: "")
        self.rootVC = vc
    }

}

