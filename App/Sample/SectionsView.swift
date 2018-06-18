
import iCarousel
import UIKit

private func SECTIONS_VIEW_LOG(_ message: String)
{
    NSLog("SectionsView \(message)")
}

// TODO Take view width as the base.
private let ITEM_WIDTH: CGFloat = 200

private let BOUNCE_DISTANCE: CGFloat = 0.2

class SectionsView: UIView, iCarouselDataSource, iCarouselDelegate
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCarousel()
    }

    var items: [SectionsItem]
    {
        get
        {
            return _items
        }
        set
        {
            _items = newValue
            self.updateItems()
        }
    }
    private var _items = [SectionsItem]()

    private func updateItems() {
        // We don't expect products to be updated,
        // so we simply assign a new batch of views.

        /*
        let height = self.frame.size.height
        let geom = CGRect(x: 0, y: 0, width: ITEM_WIDTH, height: height)

        // Recreate items.
        self.carouselItems = []
        for item in self.items
        {
            var itemView: SectionsItemView! = UIView.loadFromNib()
            itemView.frame = geom
            //itemView.delegate = self
            //self.loadProduct(id: productId, for: productView)
            self.carouselItems.append(itemView)
        }
        */
        // Display new views.
        self.carouselView.reloadData()
    }

    // MARK: - CAROUSEL
    
    @IBOutlet private var carouselView: iCarousel!

    //private var carouselItems = [SectionsItemView]()

    private func setupCarousel()
    {
        self.carouselView.dataSource = self
        self.carouselView.delegate = self
        self.carouselView.bounceDistance = BOUNCE_DISTANCE
        self.carouselView.type = .coverFlow
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return self.items.count
    }

    func carousel(
        _ carousel: iCarousel,
        viewForItemAt index: Int,
        reusing view: UIView?
    ) -> UIView
    {

        // Reuse view.
        if let view = view
        {
            return view
        }
        // Create new view.
        else
        {
            let height = self.frame.size.height
            let geom = CGRect(x: 0, y: 0, width: ITEM_WIDTH, height: height)
            //var itemView: SectionsItemView! = UIView.loadFromNib()
            var itemView = UIView()
            itemView.backgroundColor = .red
            itemView.frame = geom
            return itemView
        }
    }

    /*
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel)
    {
        self.updateNavigationButtons()
    }
    */

    /*
    // MARK: - SELECTION

    func itemSelected(itemView: ItemView) {
        if let item = self.items[] {
            self.delegate?.itemSelect(item)
        }
    }
    */

}

