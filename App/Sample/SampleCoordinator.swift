
import Hero
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

    private var srcView: SrcView!
    private var srcVC: UIViewController!

    private var dstView: DstView!
    private var dstVC: UIViewController!

    private func setupSample()
    {
        // Source.
        self.srcView = UIView.loadFromNib()
        self.srcView.sheetView.hero.id = "sheet"
        self.srcVC = UIViewControllerTemplate(mainView: self.srcView)
        self.srcVC.title = NSLocalizedString("Src.Title", comment: "")
        self.srcVC.hero.isEnabled = true

        // Destination.
        self.dstView = UIView.loadFromNib()
        self.dstView.sheetView.hero.id = "sheet"
        self.dstVC = UIViewControllerTemplate(mainView: self.dstView)
        self.dstVC.title = NSLocalizedString("Dst.Title", comment: "")
        self.dstVC.hero.isEnabled = true

        // Src->Dst animation.
        self.srcView.showReport = { [weak self ] in
            guard let this = self else { return }
            this.srcVC.hero.replaceViewController(with: this.dstVC)
        }
        // Dst->Src animation.
        self.dstView.hideReport = { [weak self ] in
            guard let this = self else { return }
            this.dstVC.hero.replaceViewController(with: this.srcVC)
        }

        self.rootVC = self.srcVC
    }

}

