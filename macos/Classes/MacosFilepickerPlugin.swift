import Cocoa
import FlutterMacOS

public class MacosFilepickerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "macos_filepicker", binaryMessenger: registrar.messenger)
    let instance = MacosFilepickerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    switch call.method {
    case "getPlatformVersion":
         
      result("macsssOS " + ProcessInfo.processInfo.operatingSystemVersionString)
      break;
    case "openFileDialog":
      let panel = NSOpenPanel()
        
       
        panel.title                   = "true";
        panel.showsResizeIndicator    = true;
        panel.showsHiddenFiles        = true;
        panel.allowsMultipleSelection = false;
        panel.canChooseFiles = true;
        panel.canChooseDirectories = true;
        panel.allowedFileTypes        = ["png"]
        if panel.runModal() == .OK {
            result(panel.url!.path)
             
        }
        else
        {
            result("null")
        }
        
      break;
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
