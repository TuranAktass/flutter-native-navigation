import UIKit
import Flutter
import UserNotifications
import CallKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate{
    
    let platform : String = "com.navigationapp.flutter/native"
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let deviceChannel = FlutterMethodChannel(name: platform,binaryMessenger: controller.binaryMessenger)
      prepareMethodHandler(deviceChannel: deviceChannel)

      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {let controller : FlutterViewController = window?.rootViewController as! FlutterViewController; deviceChannel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in if call.method == "toNative" {
             let story = UIStoryboard(name: "Main", bundle: nil)
             let rootVC = story.instantiateViewController(withIdentifier: "NativeVC") as! NativeViewController
             let navigationController = UINavigationController(rootViewController: rootVC)
             print("2222222")
             navigationController.setNavigationBarHidden(true, animated: true)
             self.window?.rootViewController = navigationController
             self.window?.makeKeyAndVisible()
         } else {
             result(FlutterMethodNotImplemented)
             return
         }})
     }
    
    func backToFlutter() {
    //    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        window.rootViewController?.navigationController?.popViewController(animated: true)
        window.rootViewController?.navigationController?.popViewController(animated: true)
    }
     
    
}
