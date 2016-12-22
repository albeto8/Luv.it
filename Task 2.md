# Task 2
#### Explain the design decisions and architecture behind the new Luv.It feed.


Luv.It feed uses an infinite scroll to populate the tableview's cells with products for sale. The app's code is organized with a MVC architectural pattern.

The data is downloaded with Alamofire library, the product images are downloaded Asynchronously and after a success download, they are cached and saved temporary.

All cells have a custom view that is similar to google's material design card.

All views are created using code instead of storyboards, for constraints and autolayout Luv.it uses SnapKit library.

Pods:

 * 'Alamofire', '~> 4.0'
 * 'SnapKit', '~> 3.0.2'

