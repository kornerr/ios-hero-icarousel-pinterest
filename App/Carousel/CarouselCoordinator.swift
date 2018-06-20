
import UIKit

private func CAROUSEL_COORDINATOR_LOG(_ message: String)
{
    NSLog("CarouselCoordinator \(message)")
}

class CarouselCoordinator: Coordinator
{

    // MARK: - SETUP

    override init()
    {
        super.init()
        self.setupSample()
    }

    // MARK: - SAMPLE

    private var sampleView: CarouselView!
    private var sectionsView: CarouselSectionsView!

    private func setupSample()
    {
        self.sampleView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate(mainView: self.sampleView)
        vc.title = NSLocalizedString("Carousel.Title", comment: "")

        self.sectionsView = UIView.loadFromNib()
        self.sampleView.sectionsContainerView.embeddedView = self.sectionsView

        self.setupSectionItems()
        self.setupCategoryItems()

        self.sectionsView.selectedItemIdChanged = { [weak self] in
            guard let this = self else { return }
            
            // Display currently selected title.
            let item = this.sectionsView.items[this.sectionsView.selectedItemId]
            this.sampleView.title = item.title

            // Print selected section id.
            CAROUSEL_COORDINATOR_LOG("Selected section: '\(this.sectionsView.selectedItemId)'")
        }
        
        self.sectionsView.selectedItemId = 5


        self.rootVC = vc
    }

    private func setupSectionItems()
    {
        // Use MassEffect races as sections: http://masseffect.wikia.com/wiki/Races
        self.sectionsView.items = [
            SectionsItem(
                "Asari",
                UIImage(named: "race.asari.png")!
            ),
            SectionsItem(
                "Drell",
                UIImage(named: "race.drell.png")!
            ),
            SectionsItem(
                "Elcor",
                UIImage(named: "race.elcor.png")!
            ),
            SectionsItem(
                "Hanar",
                UIImage(named: "race.hanar.png")!
            ),
            SectionsItem(
                "Humans",
                UIImage(named: "race.humans.jpg")!
            ),
            SectionsItem(
                "Keepers",
                UIImage(named: "race.keeper.png")!
            ),
            SectionsItem(
                "Salarians",
                UIImage(named: "race.salarians.png")!
            ),
            SectionsItem(
                "Turians",
                UIImage(named: "race.turians.png")!
            ),
            SectionsItem(
                "Volus",
                UIImage(named: "race.volus.png")!
            ),
        ]
        // TODO Set images later through DispatchQueue to simulate their loading.
    }

    private func setupCategoryItems()
    {
    }

}

