//
//  DetailViewController.swift
//  Movies
//
//  Created by Michael Ceraso on 2/2/16.
//  Copyright © 2016 Michael Ceraso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let releaseDate = movie["release_date"] as! String
        releaseDateLabel.text = releaseDate
        
        let detail = movie["overview"] as? String
        detailLabel.text = detail
        detailLabel.sizeToFit()
        let detailLabelHeight = detailLabel.frame.size.height
        detailView.frame.size.height = detailLabelHeight + 16 + titleLabel.frame.size.height + releaseDateLabel.frame.size.height
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height + detailView.frame.size.height)
        
        let baseUrl = "http://image.tmdb.org/t/p/w500"
        if let posterPath = movie["poster_path"] as? String {
            let imageUrl = NSURL(string: baseUrl + posterPath)
            imageView.setImageWithURL(imageUrl!)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
