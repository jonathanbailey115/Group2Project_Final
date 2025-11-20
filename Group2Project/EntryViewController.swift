//
//  EntryViewController.swift
//  Group2Project
//
//  Created by Orr, John W. on 11/19/25.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make text cursor default to the title text field
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
}
    
     var loadingView: UIView?
     
     func showLoadingScreen(){
         loadingView = UIView(frame: self.view.bounds)
         loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
         let activity = UIActivityIndicatorView(style: .large)
         activity.center = loadingView!.center
         activity.startAnimating()
         loadingView?.addSubview(activity)
         if let loadingView = loadingView {
             self.view.addSubview(loadingView)
         }
     }
     
     func hideLoadingScreen() {
         loadingView?.removeFromSuperview()
         loadingView = nil
     }
     
     @objc func didTapSave() {
         guard let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty else{
             return}
         showLoadingScreen()
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
             guard let self = self else { return }
             
             self.hideLoadingScreen()
             self.completion?(text, noteField.text)
         }
         
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
