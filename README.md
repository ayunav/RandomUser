# RandomUser




- the thumbnail should be stored on the local file system after it has been retrieved from the network.
- If a thumbnail has already been loaded from the network and is available from the local file system, then it should load from the local file system. 

- Animate the display of the thumbnail into the table view cell (use whatever animation you’d like). 



- Only the thumbnail for each visible cell should be loaded (i.e. don’t preemptively load all thumbnails from the network on the view appearing). 


TO-DO: 

- customize layout of the table view cell 
- Optionally make the app look as slick as you’d like (use your judgement here).
- The JSON file should be loaded from the network when the app starts. Display an appropriate loading indicator as it loads. 
- add placeholder image 
- add vc programmatically
- increase name label font 
- fix autolayout constraints in the table view cell

Resources: 

- https://swiftunboxed.com/lang/closures-escaping-noescape-swift3/
- http://swiftdeveloperblog.com/code-examples/create-uitableview-programmatically-example-in-swift/
- http://www.appcoda.com/swift3-changes/
- https://www.hackingwithswift.com/example-code/media/how-to-save-a-uiimage-to-a-file-using-uiimagepngrepresentation


Qs: 

- naming - dataprovider?? 
- app transport security, http links
- http://stackoverflow.com/questions/30731785/how-do-i-load-an-http-url-with-app-transport-security-enabled-in-ios-9
- https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html (app transport security)
