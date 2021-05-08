//
//  ViewController.swift
//  CoreDataUseApp
//
//  Created by Mac on 08.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timesTappedLabel: UILabel!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var counter: [Counter]?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        do {
            self.counter = try context.fetch(Counter.fetchRequest())
            guard let data = self.counter?.last?.tapCounter else { return }
            self.count =  Int(data)
            DispatchQueue.main.async {
                self.timesTappedLabel.text = "Times tapped: \(String(self.count))"
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func counterButtonTapped() {
        count += 1
        Counter(context: context).tapCounter = Int64(count)
        do {
            try context.save()
            DispatchQueue.main.async {
                self.timesTappedLabel.text = "Times tapped: \(String(self.count))"
            }
        } catch {
            print(error)
        }
    }
    
}
