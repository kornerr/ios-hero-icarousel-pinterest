
import UIKit

private func PINTEREST_LAYOUT_LOG(_ message: String)
{
    NSLog("PinterestLayout \(message)")
}

class PinterestLayout: UICollectionViewFlowLayout
{

    // MARK: - SETUP

    override func prepare()
    {
        PINTEREST_LAYOUT_LOG("prepare")
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

    // NOTE Make sure to provide item sizes before first rendering.
    var itemSizes = [CGSize]()

    private var columnsCount = 2
    private var cellPadding: CGFloat = 6
    private var cache = [UICollectionViewLayoutAttributes]()

    private func setupItemSizes()
    {
        guard
            self.cache.isEmpty == true,
            self.itemSizes.isEmpty == false,
            let collectionView = self.collectionView
        else
        {
            return
        }
        let columnWidth = self.contentWidth / CGFloat(self.columnsCount)
        var xOffsets = [CGFloat]()
        for column in 0..<self.columnsCount
        {
            xOffsets.append(CGFloat(column) * columnWidth)
        }
        var yOffsets = [CGFloat](repeating: 0, count: self.columnsCount)

        var column = 0
        for id in 0..<collectionView.numberOfItems(inSection: 0)
        {
            let size = self.itemSizes[id]
            // Calculate factor to resize item to:
            // * make item's width match columnWidth
            // * keep item's aspect ratio
            let factor = size.width / columnWidth
            // Calculate new height keeping original aspect ratio.
            let height = size.height / factor + self.cellPadding * 2
            let frame =
                CGRect(
                    x: xOffsets[column],
                    y: yOffsets[column],
                    width: columnWidth,
                    height: height
                )
            let insetFrame =
                frame.insetBy(dx: self.cellPadding, dy: self.cellPadding)

            let indexPath = IndexPath(item: id, section: 0)
            let attributes =
                UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            self.cache.append(attributes)

            self.contentHeight = max(self.contentHeight, frame.maxY)
            yOffsets[column] = yOffsets[column] + height

            // Toggle column between 1 and 0.
            column = column < (self.columnsCount - 1) ? (column + 1) : 0
        }
    }

    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        var visibleAttributes = [UICollectionViewLayoutAttributes]()
        // Find items that are in the rectangle.
        for item in self.cache
        {
            if item.frame.intersects(rect)
            {
                visibleAttributes.append(item)
            }
        }
        return visibleAttributes
    }

    override func layoutAttributesForItem(
        at indexPath: IndexPath
    ) -> UICollectionViewLayoutAttributes? {
        return self.cache[indexPath.item]
    }

}

