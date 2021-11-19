import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!

    private var countNumber = 0
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        countButton.rx.tap // ボタンがタップされたことを通知してくれるObservable(受け取り）
            .subscribe({[unowned self] _ in // subscribe　変化があったら呼ばれる
                self.countNumber += 1
                self.countLabel.text = String(self.countNumber)
            })
            .disposed(by: disposeBag) // メモリリーク防ぐために開放する
    }

}
