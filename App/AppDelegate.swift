
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
        // Create sample coordinator.
        self.setupSampleCoordinator()
        // Display window.
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        return true
    }

    // MARK: - SAMPLE COORDINATOR

    private var sampleCoordinator: SampleCoordinator!
    
    private func setupSampleCoordinator()
    {
        self.sampleCoordinator = SampleCoordinator()
        self.window!.rootViewController = self.sampleCoordinator.rootVC

        // If root VC changes, re-assign it to the window.
        self.sampleCoordinator.rootVCChanged = { [weak self] in
            guard let this = self else { return }
            this.window!.rootViewController = this.sampleCoordinator.rootVC
        }
    }

}

