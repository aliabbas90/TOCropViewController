//
//  CropViewController.swift
//  TOCropViewControllerExample
//
//  Created by Ali ABBAS on 01/04/2018.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

import UIKit

class CropViewController: UIViewController {

    @IBOutlet weak var croppedImageView: UIImageView!
    private var cropView: TOCropView!
    @IBOutlet weak var cropContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cropView = TOCropView(croppingStyle: TOCropViewCroppingStyle.default, image: UIImage(named:"ali")!)
        self.cropView.frame = cropContent.frame
        self.cropView.aspectRatioLockEnabled = true
        self.cropView.cropBoxResizeEnabled = false
        self.cropView.resetLayoutToDefault(animated: false)
        cropContent.insertSubview(self.cropView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.cropView.frame = cropContent.frame
         self.cropView.setCropBoxFrame(self.view.frame)
        
    }
    
    @IBAction func cropp(_ sender: Any) {
        print(self.cropView.imageCropFrame)
        self.croppedImageView.image = UIImage(named:"ali")!.croppedImage(withFrame: self.cropView.imageCropFrame, angle: 0, circularClip: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
