//
//  QRCodeAttendance.swift
//  Attendist
//
//  Created by Ruthvik Penubarthi on 1/6/20.
//  Copyright © 2020 Ruthvik Penubarthi. All rights reserved.
//
import UIKit
import AVFoundation
import FirebaseDatabase
import Firebase

var dateStamp = ""
var qrCodeInfo = ""
class QRCodeAttendance: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    //@IBOutlet weak var lblStudentCode: UILabel!
   
//    @IBOutlet weak var lblStudentCode: UILabel!
//    @IBOutlet weak var cameraPreviewView: UIView!
    //@IBOutlet weak var lblStudentCode: UILabel!
    //@IBOutlet weak var cameraPreviewView: UIView!
    
    
    
    @IBOutlet weak var lblStudentCode: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cameraPreviewView: UIView!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    @IBAction func backButtonIsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   override func viewDidLoad() {
          super.viewDidLoad()
          
          view.backgroundColor = UIColor.white
          captureSession = AVCaptureSession()
          
          guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video,
               position: .front) else { return }
          
          let videoInput: AVCaptureDeviceInput
          
          do {
              videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
          } catch {
              return
          }
          
          if (captureSession.canAddInput(videoInput)) {
              captureSession.addInput(videoInput)
          } else {
              failed()
              return
          }
          
          let metadataOutput = AVCaptureMetadataOutput()
          
          if (captureSession.canAddOutput(metadataOutput)) {
              captureSession.addOutput(metadataOutput)
              
              metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
              metadataOutput.metadataObjectTypes = [.qr]
          } else {
              failed()
              return
          }
          
          previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
           previewLayer.frame = cameraPreviewView.bounds
          previewLayer.videoGravity = .resizeAspectFill
          cameraPreviewView.layer.addSublayer(previewLayer)
          
          captureSession.startRunning()
    
      }
      
      func failed() {
          let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
          ac.addAction(UIAlertAction(title: "OK", style: .default))
          present(ac, animated: true)
          captureSession = nil
      }
      
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          if (captureSession?.isRunning == false) {
              captureSession.startRunning()
          }
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          
          if (captureSession?.isRunning == true) {
              captureSession.stopRunning()
          }
      }
      
      func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
          captureSession.stopRunning()
          
          if let metadataObject = metadataObjects.first {
              guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
              guard let stringValue = readableObject.stringValue else { return }
              AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
              AudioServicesPlaySystemSound (1108);
              found(code: stringValue)
          }
      }
      
      func found(code: String) {
        captureSession.startRunning()
        qrCodeInfo = code
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dataStamp = dateFormatter.string(from: date)
        dateStamp = dataStamp
        let ref = Database.database().reference()
        ref.child("Teachers").child(signedInUser).child("Classes").child(selectedClass).child(qrCodeInfo).child(dateStamp).setValue("Present")
      }
      
      override var prefersStatusBarHidden: Bool {
          return true
      }
      
      override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .portrait
      }
      
}
