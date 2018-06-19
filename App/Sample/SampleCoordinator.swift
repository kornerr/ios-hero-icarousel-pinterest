
import SkeletonView
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
    private var sectionsView: SectionsView!

    private func setupSample()
    {
        self.sampleView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.sampleView)
        vc.title = NSLocalizedString("Sample.Title", comment: "")

        self.sectionsView = UIView.loadFromNib()
        self.sampleView.sectionsContainerView.embeddedView = self.sectionsView
        self.setupItems()

        self.rootVC = vc
    }

    private func setupItems()
    {
        // Use MassEffect races as sections: http://masseffect.wikia.com/wiki/Races
        self.sectionsView.items = [
            SectionsItem("Asari"),
            SectionsItem("Drell"),
            SectionsItem("Elcor"),
            SectionsItem("Hanar"),
            SectionsItem("Humans"),
            SectionsItem("Keepers"),
            SectionsItem("Salarians"),
            SectionsItem("Turians"),
            SectionsItem("Volus"),
        ]
        self.sectionsView.showAnimatedGradientSkeleton()

        // TODO Set images later through DispatchQueue to simulate their loading.
    }


}

