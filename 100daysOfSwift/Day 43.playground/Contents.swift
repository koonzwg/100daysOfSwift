import UIKit

/*
 Day 43
 
 - Navigation: Introduction
 - The problem with a simple NavigationLink
 - Handling navigation the smart way with navigationDestination()
 */


// Navigation: Introduction
/*
 - How to move from one screen to another using NavigationStack, both because:
 
 1. The user asked for it
 2. We want to do it automatically at a specific time
 
 - Once we cover the basics, we will look at more advanced navigation, including handling:
 
 1. State restoration: remembering exactly where the user had navigated to, so when your app launches in the future they can pick up where they left off
 2. Customization options: Changing the way the navigation bar looks, positioning your buttons just right, and even how to let your user change the navigation title on demand
 */


// The problem with a simple NavigationLink
/*
 - When you have lots of different integers to show in the same way, for example - SwiftUI gives us a better solution:
 
 Attaching a presentation value to our navigation link
 */


// Handling navigation the smart way with navigationDestination()
/*
 - For more advanced navigation, it's better to separate the destination from the value. This allows SwiftUI to load the destination only when it's needed.
 
 Doing this takes 2 steps:
 1. We attach a value to the NavigationLink. This value can be anything you want - a string, an integer, a custom struct instance, or whatever. However this is one requirement: Whatever type you use must conform to a protocol called Hashable
 2. Attaching a navigationDestination() modifier inside the navigation stack, telling it what to do when it receives your data
 
 - For more complex data such as custom structs, we need to use hashing
 */



