import UIKit

/*
 Day 44
 
 - Programmatic navigation with NavigationStack
 - Navigating to different data types using NavigationPath
 - How to make a NavigationStack return to its root view programmatically
 - How to save NavigationStack paths using Codable
 
 */


// Programmatic navigation with NavigationStack
/*
 Programmatic navigation allows us to move from one view to another just using code, rather than waiting for the user to take a specific action.
 
 For example:
 
 Maybe your app is busy processing some user input and you want to navigate to a result screen whent hat work is finished - you want the navigation to happen automatically when you say so, rather than as a direct response to user input
 
 In SwiftUI this is done by binding the path of a NavigationStack to an array of whatever data you're navigating with. So, we might start with this:
 
 struct ContentView: View {
     @State private var path = [Int]()

     var body: some View {
         NavigationStack(path: $path) {
             VStack {
                 // more code to come
             }
             .navigationDestination(for: Int.self) { selection in
                 Text("You selected \(selection)")
             }
         }
     }
 }
 
 The does 2 important things:
 
 1. It creates an @State property to store an array of integers.
 2. It binds that property to the path of our NavigationStack, meaning that changing the array will automatically navigate to whatever is in the array, but also changes the array as the user presses back in the navigation bar.
 
 You can mix user navigation and programmatic navigation as much as you want - SwiftUI will take care of making sure your path array stays in sync with wahtever data you show, regardless of how it's shown
 */


// Navigating to different data types using NavigationPath
/*
 - Navigating to different data types takes one of 2 forms. The simplest is when you're using navigationDestination() with different data types but you aren't tracking the exact path that's being shown, because here things are straightforward: just add navigationDestination() multiple times, once for each type of data you want.
 
 However, things are more complicated when you want to add in programmatic navigation, because you need to be able to bind some data to the navigation stack's path.
 
 - SwiftUI's solution is a special type called NavigationPath, which is able to hold a variety of data types in a single path. In practice it works very similarly to an array - we can make a property using it, like this:
 
 @State private var path = NavigationPath()
 
 Bind this to a NavigationStack
 
 NavigationStack(path: $path) {
 
 Then push things to it programmatically, for example with toolbar buttons:
 
 .toolbar {
     Button("Push 556") {
         path.append(556)
     }

     Button("Push Hello") {
         path.append("Hello")
     }
 }
 
 - NavigationPath is what we call a type-eraser: it stores any kind of Hashable data without exposing exactly what type of data each item is.
 */


// How to make a NavigationStack return to its root view programmatically
/*
 - It's common to be several levels deep in a NavigationStack, then to decide you want to return to the beginning.
 
 How can you return home if you are multiple views from a subview, when you don't have access to the original path property?
 
 1. Either store your path in an external class that uses @Observable
 2. Bring in a new property wrapper called @Binding
 */


// How to save NavigationStack paths using Codable
/*
 - You can save and load the navigation stack path using Codable in one of 2 ways, depending on what kind of path you have:
 
 1. If you're using NavigationPath to store the active path of your NavigationStack, SwiftUI provides 2 helpers to make saving and loading your paths easier.
 2. If you're using a homogenous array - e.g. [Int] or [String] - then you don't need those helpers, and you can load or save your data freely.
 
 The techniques are very similar:
 
 Both rely on storing your path outside your view, so that all the loading and saving of path data happens invisibly - an external class just takes care of it automatically. 
 */
