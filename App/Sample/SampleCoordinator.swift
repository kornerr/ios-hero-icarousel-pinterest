
import UIKit

class SampleCoordinator
{

    // MARK: - SETUP

    var rootVC: UIViewController!
    var rootVCChanged: SimpleCallback?

    init()
    {
        self.setupSample()
    }

    // MARK: - SAMPLE

    //private var srcView: SrcView!
    private var srcView: DstView!

    private func setupSample()
    {
        // Create View and VC.
        self.srcView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.srcView)
        vc.title = NSLocalizedString("Sample.Title", comment: "")
        let nc = UINavigationController(rootViewController: vc)
        self.rootVC = nc
    }

}

