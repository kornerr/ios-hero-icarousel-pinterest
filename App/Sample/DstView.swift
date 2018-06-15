
import UIKit

class DstView: UIView
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    @IBOutlet var sheetView: UIView!

    // MARK: - HIDE

    var hideReport: SimpleCallback?
    
    @IBAction func hide(_ sender: Any)
    {
        if let report = hideReport
        {
            report()
        }
    }
}

