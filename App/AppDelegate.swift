
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    // MARK: - SETUP

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Create window.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.setupCoordinators()

        // Display window.
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        return true
    }

    // MARK: - COORDINATORS

    private var heroCoordinator: HeroCoordinator!
    private var sampleCoordinator: CarouselCoordinator!
    private var pinterestCoordinator: PinterestCoordinator!

    private func setupCoordinators()
    {
        self.heroCoordinator = HeroCoordinator()
        self.sampleCoordinator = CarouselCoordinator()
        self.pinterestCoordinator = PinterestCoordinator()

        let tc = UITabBarController()
        tc.viewControllers = [
            self.sampleCoordinator.rootVC,
            self.pinterestCoordinator.rootVC,
            self.heroCoordinator.rootVC,
        ]

        self.window!.rootViewController = tc
    }

}

