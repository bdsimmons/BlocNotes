//
//  CreateNoteViewController.swift
//  Bloc Notes
//
//  Created by Benjamin Simmons on 1/31/16.
//  Copyright © 2016 Ben Simmons. All rights reserved.
//

import UIKit
import CoreData

class CreateNoteViewController : UIViewController {
    
    @IBOutlet weak var newNoteTitle: UITextField!
    @IBOutlet weak var newNoteBody: UITextView!

    var note: NSManagedObjectContext? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("CreateNoteViewController Triggered!")
    }
    
    @IBAction func createNewNote(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Note",
            inManagedObjectContext:managedContext)
        
        let note = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        note.setValue(NSDate(), forKey: "timeStamp")
        note.setValue(self.newNoteTitle.text!, forKey: "title")
        note.setValue(self.newNoteBody.text!, forKey: "body")
        
        do {
            try managedContext.save()
            self.navigationController?.popToRootViewControllerAnimated(true)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
