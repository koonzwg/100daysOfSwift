import UIKit

/*
 Day 36
 - iExpense: Introduction
 - Using @State with classes
 - Sharing SwiftUI state with @Observable
 - Showing and hiding views
 - Deleting items using onDelete()
 - Storing user settings with UserDefaults
 - Archiving Swift objects with Codable
 */


// iExpense: Introduction
/*
 - Next 2 projects are going tos tart pushing my SwiftUI skills beyond the basics, as we explore apps that have multiple screens, that load and save user data, and have more complex user interfaces
 
 - iExpense is an expense tracker that separates personal costs from business costs. At its core, its an app with a form and a list but in order to accomplish those 2 things I'm going to need to learn how to:
 
 1. Present and dismiss a second screen of data
 2. Delete rows from a list
 3. Save and load user data
 */


// Using @State with classes
/*
 - @State property wrapper is designed for simple data that is local to the current view, but as soon as you want to share data you need to take some important extra steps.
 
 Heres a struct to store a user's first and last name:
 
 struct User {
 var firstName = "Bilbo"
 var lastName = "Baggins"
 }
 
 We can now use that in a SwiftUI view by creating an @State property and attaching things to:
 - $user.firstName
 - $user.lastName
 
 struct ContentView: View {
     @State private var user = User()

     var body: some View {
         VStack {
             Text("Your name is \(user.firstName) \(user.lastName).")

             TextField("First name", text: $user.firstName)
             TextField("Last name", text: $user.lastName)
         }
     }
 }
 
 - If we want to share data between multiple views - if we want 2 or more views to point to the same data so that when one changes they all get those changes - we need to use classes rather than structs
 
 When user was a struct, every time we modified a property of that struct Swift was actually creating a new instance of the struct. @State was able to spot that change, and automatically reloaded our view.
 
 Now that we have a class, that behavior no longer happens: Swift can just modify the value directly
 
 - We can fix this problem with one small change: Add the line @Observable before the class
 */


// Sharing SwiftUI state with @Observable
/*
 - If you use @State with a struct, your SwiftUI view will update automatically when a value changes, but if you use @State with a class then you must mark that class with @Observable if you want SwiftUI to watch its contents for changes
 
 @Observable
 class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
 }
 
 This is a class with 2 string variables, but it starts with @Observable. That tells SwiftUI to watch each individual property inside the class for changes, and reload any view that relies on a property when it changes.
 
 @Observable is doing the following:
 
 1. Our 2 properties are marked @ObservationTracked, which means Swift and SwiftUI are watching them for changes.
 2. If you right-click on @ObservationTracked you can expand that macro too - yes, it's a macro inside a macro. This macro has the job of tracking whenever any property is read or written, so that SwiftUI can update only views that absolutely need to be refreshed
 3. Our class is made to conform to the Observable protocol. This is important, because some parts of SwiftUI look for this to mean "this class can be watched for changes"
 */


// Showing and hiding views
/*
 There are several ways of showing views in SwiftUI, one of the most basic is a sheet
 
 - Sheet: a new view presented on top of our existing one
 On iOS this automatically gives us a card-like presentation where the current view slides away into the distance a little and the new view animates in on top
 
 Sheets work much like alerts, in that we don't present them directly with code such as mySheet.present() or similar. Instead, you define the conditions under which a sheet should be shown, and when those conditions become true or false the sheet will either be presented or dismissed respectively.
 
 1. You need some state to track whether the sheet is showing. Just as with alerts, this can be a simple boolean.
 2. You need to toggle that when your button is tapped
 3. You need to attach your sheet somewhere to your view hierarchy
 
 Button("Show sheet") {
     showingSheet.toggle()
 }
 .sheet(isPresented: $showingSheet) {
     //contents of the sheets
 }
 
 4. Decide what should actually be in the sheet
 
 struct ContentView: View {
     @State private var showingSheet = false

     var body: some View {
         Button("Show Sheet") {
             showingSheet.toggle()
         }
         .sheet(isPresented: $showingSheet) {
             SecondView()
         }
     }
 }
 */


// Deleting items using onDelete()
/*
 - SwiftUI gives us the onDelete() modifier for us to use to control how objects should be deleted from a collection.
 
 This is almost exclusively used with List and ForEach
 
 You can create a list of rows that are showing using ForEach, then attach onDelete() to that ForEach so the user can remove rows they don't want.
 */


// Storing user settings with UserDefaults
/*
- Most users pretty much expect apps to store their data so they can create more customized experiences, and as such it's no surprise that iOS gives you several ways to read and write user data
 
 One common way to store a small amount of data is called UserDefaults, and it's great for simple user preferences.
 
 There is no specific number attached to "a small amount", but everything you store in UserDefaults will automatically be loaded when your app launches - if you store a lot in there your app launch will slow down.
 
 As a rough idea, you should aim to store no more than 512 KB in there
 
 - UserDefaults is perfect for storing things like when the user last launched the app, which news story they last read, or other passively collected information.
 
 Even better, SwiftUI can often wrap up UserDefaults inside a nice and simple property wrapper called @AppStorage - it only supports a subset of functionality right now, but it can be really helpful
 
 UserDefaults.standard.set(tapCount, forKey: "Tap")

 In the single line of code above, you can see 3 things in action:
 1. We need to use UserDefaults.standard. This is the built-in instance of UserDefaults that is attached to our app, but in more advanced apps you can create your own instances. For example, if you want to share defaults across several app extensions you might create your own UserDefaults instance.
 2. There is a single set() method that accepts any kind of data - integers, Booleans, strings, and more.
 3. We attach a string name to this data, in our case it's the key "Tap". This key is case-sensitive, just like regular Swift string, and it's important - we need to use the same key to read the data back out of UserDefaults
 
 - SwiftUI provides an @AppStorage property wrapper around UserDefaults, and in simple situations like this one it's really helpful.
 
 It effectively ignores UserDefaults entirely, and just use @AppStorage rather than @State
 
 3 things to notice:
 
 1. Our access to the UserDefaults system is through the @AppStorage property wrapper. This works like @State: when the value changes, it will reinvoked the body property so our UI reflects the new data
 2. We attach a string name, which is the UserDefaults key where we want to store the data. I've used "tapCount", but it can be anything at all - it doesn't need to match the property name.
 3. The rest of the property is declared as normal, including providing a default value of 0. That will be used if there is no existing value saved inside UserDefaults
 
 - When it comes to you submitting an app to the App Store, Apple asks that you let them know why you're loading and saving data using UserDefaults. This also applies to the @AppStorage property wrapper. It's nothing to worry about, they just want to make sure developers aren't trying to identify users across apps.
 
 */


// Archiving Swift objects with Codable
/*
 
 */

