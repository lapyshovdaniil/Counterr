//
//  ViewController.swift
//  Counter
//
//  Created by Даниил Лапышов on 9.10.2024.
//
import UIKit
final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CountLabel.text = "0"
        TextView.text = "История изменений: \n"
        TextView.isEditable = false
    }
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var CountLabel: UILabel!
    
    private var count : Int = 0
    private let currentDate = Date.now
    private let formatDate = DateFormatter()
    
  private func DateFormat () {
        formatDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    @IBAction func AddButton(_ sender: Any) {
        DateFormat()
        count += 1
        CountLabel.text = String(count)
        TextView.text += "[\(formatDate.string(from: currentDate))]: значение изменено на +1.\n"
        TextView.scrollToBottom()
    }
    
    @IBAction func subtraction(_ sender: Any) {
        DateFormat()
        if count <= 0 {
            CountLabel.text = "0"
            TextView.text += "[\(formatDate.string(from: currentDate))]: попытка уменьшить значение счетчика ниже 0.\n"
            TextView.scrollToBottom()
        }
        else {
            count -= 1
            CountLabel.text = String(count)
            TextView.text += "[\(formatDate.string(from: currentDate))]: значение изменено на -1.\n "
            TextView.scrollToBottom()
        }
    }
    
    @IBAction func update(_ sender: Any) {
        DateFormat()
        count = 0
        CountLabel.text = String(count)
        TextView.text += "[\(formatDate.string(from: currentDate))]: значение сброшено.\n"
        TextView.scrollToBottom()
    }
    }

extension UITextView {
    func scrollToBottom() {
        if self.contentSize.height < self.bounds.size.height {
            return
        }
        let bottomOffset = CGPoint(x: 0.0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}




