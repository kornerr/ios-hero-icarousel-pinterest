
import UIKit

class PinterestLayout: UICollectionViewFlowLayout
{

    // MARK: - SETUP

    override func prepare()
    {
        self.setupItemSizes()
    }

    // MARK: - CONTENT SIZE

    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat
    {
        guard let collectionView = self.collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    override var collectionViewContentSize: CGSize
    {
        return CGSize(width: self.contentWidth, height: self.contentHeight)
    }

    // MARK: - ITEM SIZES

    var itemSizes = [CGSize]()

    private var columnsCount = 2
    private var cellPadding: CGFloat = 6
    private var cache = [UICollectionViewLayoutAttributes]()

    private func setupItemSizes()
    {
    }


}

