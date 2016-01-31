//
//  DetailViewController.swift
//  Bloc Notes
//
//  Created by Benjamin Simmons on 1/28/16.
//  Copyright © 2016 Ben Simmons. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var noteBodyLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let timeStampLabel = self.detailDescriptionLabel {
                timeStampLabel.text = detail.valueForKey("timeStamp")!.description
            }
            if let noteTitleLabel = self.noteTitleLabel {
                noteTitleLabel.text = detail.valueForKey("title")!.description
            }
            if let noteDescriptionLabel = self.noteBodyLabel {
                noteDescriptionLabel.text = detail.valueForKey("body")!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

