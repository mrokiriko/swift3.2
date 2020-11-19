
import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tappableView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    var labelNumber = 0
    
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(
        target: self,
        action: #selector(tappableViewDidSlide(_:))
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
        
        tappableView.addGestureRecognizer(panGestureRecognizer)
    }

    @IBAction func tap(_ sender: Any) {
        tappableView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    @objc func tappableViewDidSlide(_ sender: UIPanGestureRecognizer)
    {
        
        switch sender.state {
            
            case .changed:
                let point = sender.velocity(in: tappableView)
                        
                labelNumber += Int(-point.y / 100)
            
                updateLabel()
            
            default: break
            
        }
        
    }
    
    func updateLabel() -> Void {
        
        countLabel.text = String(labelNumber)
        
    }
    
}
