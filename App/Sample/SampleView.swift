
import iCarousel
import UIKit

class SampleView: UIView
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    // MARK: - SECTIONS' CONTAINER

    @IBOutlet var sectionsContainerView: UIView!

    // MARK: - TITLE
    
    @IBOutlet private var titleLabel: UILabel!

    var title: String?
    {
        get
        {
            return self.titleLabel.text
        }
        set
        {
            self.titleLabel.text = newValue
        }
    }
    
}

