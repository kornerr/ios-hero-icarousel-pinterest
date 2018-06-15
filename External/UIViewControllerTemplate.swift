
import UIKit

class UIViewControllerTemplate<MainView: UIView>: UIViewController
{

    var mainView: MainView!

    init(mainView: MainView)
    {
        super.init(nibName: nil, bundle: nil)
        // Keep main view.
        self.mainView = mainView
        // Embed it.
        self.view.embeddedView = self.mainView
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("UIViewControllerTemplate. ERROR: init(coder:) has not been implemented")
    }

}

