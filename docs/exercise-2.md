### Exercise 2 - Pull Requests Layout

Write a service that gets **open** PR's from a users github `Event`s. [This API](https://developer.github.com/v3/activity/events/) might help.

Then add a `StateList` of `PullRequest`s to your `ApplicationState` and have it scheduled to refresh your state every minute by calling your service.

Create a `PullRequestsLayout` that displays the title and a list of PR's from the `ApplicationState`. Some basic `DisplayCompoents` have been provided for you :)

Add two listeners that `Increment` and `Decrement` the state of `PullRequest`s. The listeners should refresh the display after incrementing/decrementing the state.

__Hint:__ Custom listeners implement `GpioPinListenerDigital`.

__Hint:__ Take the `PinState` into account on the `GpioPinDigitalStateChangeEvent` when handling the change event, or you may run your code multiple times!

__Success Criteria:__ Displaying a list of PR's and being able to scroll through them with your joystick. 
At this point you should also be able to press on the **Center Joystick** to cycle through your parent layouts.
