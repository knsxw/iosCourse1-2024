//
//  AppViewController.swift
//  App Store Top Chart App
//
//  Created by Sasori on 20/7/2567 BE.
//

import UIKit

class AppViewController: UIViewController {

    var appInfo: AppInfo?
    
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var AppScroll: UIScrollView!
    
    @IBOutlet weak var appDescription: UILabel!
    @IBOutlet weak var appChart: UILabel!
    @IBOutlet weak var appAge: UILabel!
    @IBOutlet weak var appRating: UILabel!
    @IBOutlet weak var appIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = appInfo?.appName
        navigationController?.navigationBar.prefersLargeTitles = false
        appIcon.layer.cornerRadius = 20
        appName.text = appInfo?.appName
        shortDescription.text = appInfo?.shortDescription
        appDescription.text = appInfo?.detailedDescription
        appRating.text = "\(appInfo!.rating)"
        appIcon.image = UIImage(named: appInfo?.appIcon ?? "")
        appAge.text = appInfo?.age
        appChart.text = "#\(appInfo!.topChartPosition)"
        
        let spacing: CGFloat = 10
        var xOffset: CGFloat = 20
        for imageName in appInfo!.screenshotGallery {
            if let image = UIImage(named: imageName) {
                let imageView = UIImageView(image: image)
                imageView.frame = CGRect(x: xOffset, y: 0, width: 200, height: AppScroll.frame.height)
                AppScroll.addSubview(imageView)
                xOffset += imageView.frame.width + spacing
            }
            AppScroll.contentSize = CGSize(width: xOffset - spacing, height: AppScroll.frame.height)
            AppScroll.isPagingEnabled = true
        }
        
        // Do any additional setup after loading the view.
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
