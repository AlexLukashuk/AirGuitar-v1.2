//
//  Camera.swift
//  AnimationProject
//
//  Created by Oleksandr Lukashuk on 9/27/19.
//  Copyright © 2019 Oleksandr Lukashuk. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    @IBOutlet weak var photoPreviewImageView: UIImageView!
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCapturePhotoOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Config.shared.colorForBackground
        
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        
        let backCamera =  AVCaptureDevice.default(for: AVMediaType.video)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }

        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
//            stillImageOutput = [AVVideoCodecKey: AVVideoCodecJPEG]

            if session!.canAddOutput(stillImageOutput!) {
                session!.addOutput(stillImageOutput!)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
                videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspect
                videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait

                view.layer.addSublayer(videoPreviewLayer!)
                session!.startRunning()

            }

        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(true)

       videoPreviewLayer!.frame = view.bounds
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = Config.shared.colorForBackground
//    }
    
    @IBAction func didTapOnTakePhotoButton(_ sender: UIButton) {
        
    }
}

