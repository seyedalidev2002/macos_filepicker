# macos_filepicker
A package that allows you to open native file exploer on Mac OS to select a diractory or file
# Getting Started
after intalling the pagckage 
add the following code to "project/macos/Runner/Debug.entitlements"

```xml
<dict>
.
.
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
.
.
</dict>    
```
### create and instance of MacosFilePicker:
```dart
    MacosFilepicker picker = MacosFilepicker(
                        title: "My Title",
                        canChooseDirectories: true,
                        canChooseFiles: true,
                        showHiddenFiles: true,
                        showReiszeIndicator: false);
```
if you want the user to be able to only pick one file use ```picker.getFile()```
and if you want the user to be able to get multiple files use ```picker.getMultipleFiles()```