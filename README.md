# Random User

## Requirements 

1. Create an iPhone app that displays the information loaded from this JSON file: https://docs.google.com/uc?id=0B5ewEKtUcFsGMFA0eFFSc08zNGc&export=download. 

2. The JSON file should be loaded from the network when the app starts. Display an appropriate loading indicator as it loads. 

3. Display the thumbnail and name for each user object in a table view. 

4. The thumbnail should be loaded in the background, and be stored on the local file system after it has been retrieved from the network.

5. Animate the display of the thumbnail into the table view cell (use whatever animation you’d like). 

6. Only the thumbnail for each visible cell should be loaded (i.e. don’t preemptively load all thumbnails from the network on the view appearing). 

7. If a thumbnail has already loaded from the network and is available from the local file system, then it should load from the local file system. 

You can provide the solution in either Objective-C or Swift.  Optionally make the app look as slick as you’d like (use your judgement here). 

- Do not use storyboards

- Use ARC

- Use Autolayout

- Use the latest version of the iOS SDK
