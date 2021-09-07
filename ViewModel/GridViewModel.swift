import UIKit

class GridViewController: UIViewController {
    
   
    
    private var model: [String]?
    var randomPictures = ["car1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1"]
    
    @IBOutlet var favButton: UIButton?
    @IBOutlet var filterButton: UIButton?
    @IBOutlet var gridCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = randomPictures
        
        favButton?.tintColor = UIColor.cyan
        
        gridCollectionView?.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionViewCell")
        gridCollectionView?.dataSource = self
        gridCollectionView?.delegate = self
        
        
        
    }
    
    
}

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let model = model else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
}
