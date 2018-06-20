
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    // MARK: - SETUP

    var window: UIWindow?
    private var coordinator: Coordinator!


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Create window.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.setupCoordinator()

        // Display window.
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        return true
    }

    // MARK: - COORDINATORS

    private func setupCoordinator()
    {
        // NOTE Use only one coordinator at a time.
        //self.coordinator = HeroCoordinator()
        //self.coordinator = SampleCoordinator()
        self.coordinator = PinterestCoordinator()

        self.window!.rootViewController = self.coordinator.rootVC

        // If root VC changes, re-assign it to the window.
        self.coordinator.rootVCChanged = { [weak self] in
            guard let this = self else { return }
            this.window!.rootViewController = this.coordinator.rootVC
        }
    }

}

