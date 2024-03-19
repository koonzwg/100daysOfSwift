import UIKit

/*
 Day 39
 - Moonshot: Introduction
 - Resizing images to fit the available space
 - How ScrollView lets us work with scrolling data
 - Pushing new views onto the stack using NavigationLink
 - Working with hierarchical Codable data
 - How to lay out views in a scrolling grid
 */


// Resizing images to fit the available space
/*
 
 */


// How ScrollView lets us work with scrolling data
/*
 
 */


// Pushing new views onto the stack using NavigationLink
/*
 - NavigationStack shows a navigation bar at the top of our views, but also does something else: Allows you to push views onto the view stack.
 
 - NavigationLink: Give this a destination and something can be tapped, and it will take care of the rest.
 
 - Both sheet() and NavigationLink allow you to show a new view from the current one, but the way they do it is different and you should choose them carefully:
 
 1. NavigationLink is for showing details about the user's selection, like you're digging deeper into a topic
 2. Sheet() is for showing unrelated content, such as settings or a compose window
 
 The most common place you see NavigationLink is with a list, and there SwiftUI does something quite marvelous
 */


// Working with hierarchical Codable Data
/*
 
 */


// How to lay out views in a scrolling grid
/*
 - SwiftUI's List view is a great way to show scrolling rows of data, but sometimes you also want columns of data - a grid of information, that is able to adapt to show more data on larger screens
 
 In SwiftUI this is accomplished with 2 views:
 
 1. LazyHGrid for showing horizontal data
 2. LazyVGrid for showing vertical data
 
 GridItem.adaptive is most commonly used because they allow grids that make maximum use of available screen space.
 */


