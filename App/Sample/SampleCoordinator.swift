
import UIKit

class SampleCoordinator: Coordinator
{

    // MARK: - SETUP

    override init()
    {
        super.init()
        self.setupSample()
    }

    // MARK: - SAMPLE

    private var sampleView: SampleView!

    private func setupSample()
    {
        self.sampleView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.sampleView)
        vc.title = NSLocalizedString("Sample.Title", comment: "")

        self.rootVC = vc
    }

}

