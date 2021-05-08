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
    case "getFile":
        if let res  = getFile(call:call) as?String{
            result(res)}
        else{
            result(nil)
        }
      break;
    case "getMultipleFiles":
        if let res  = getMultipleFiles(call:call) as?Array<String>{
            result(res)
        }
        else{
            result(nil)
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    func getFile(call: FlutterMethodCall) -> String? {
      if
        let args = call.arguments as? Dictionary<String, Any>,
      let title = args["title"] as? String,
      let showsResizeIndicator = args["showsResizeIndicator"] as? Bool,
      let showsHiddenFiles = args["showsHiddenFiles"] as? Bool,
      let canChooseFiles = args["canChooseFiles"] as? Bool,
      let canChooseDirectories = args["canChooseDirectories"] as? Bool
      {
    let panel = NSOpenPanel()
        panel.title = title
        panel.showsResizeIndicator = showsResizeIndicator
        panel.showsHiddenFiles = showsHiddenFiles
        panel.allowsMultipleSelection = false//open single file
        panel.canChooseFiles = canChooseFiles
        panel.canChooseDirectories = canChooseDirectories
        if let allowedTypes = args["allowedTypes"] as? Array<String>{
            panel.allowedFileTypes = allowedTypes}

        return panel.runModal() == .OK ?panel.url!.path : nil
      }
      return nil
    }
    func getMultipleFiles(call: FlutterMethodCall) -> Array<String>? {
      if
        let args = call.arguments as? Dictionary<String, Any>,
      let title = args["title"] as? String,
      let showsResizeIndicator = args["showsResizeIndicator"] as? Bool,
      let showsHiddenFiles = args["showsHiddenFiles"] as? Bool,
      let canChooseFiles = args["canChooseFiles"] as? Bool,
      let canChooseDirectories = args["canChooseDirectories"] as? Bool
      {
    let panel = NSOpenPanel()
        panel.title = title
        panel.showsResizeIndicator = showsResizeIndicator
        panel.showsHiddenFiles = showsHiddenFiles
        panel.allowsMultipleSelection = true//open multiple files
        panel.canChooseFiles = canChooseFiles
        panel.canChooseDirectories = canChooseDirectories
        if let allowedTypes = args["allowedTypes"] as? Array<String>{
            panel.allowedFileTypes = allowedTypes
        }
        if panel.runModal() == .OK{
            var paths :[String] = []
            for url in panel.urls{
                paths.append(url.path)
            }
            return paths
        }
        
      }
      return nil
    }
    
}
