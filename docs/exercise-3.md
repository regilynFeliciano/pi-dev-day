### Exercise 3 - Pull Requests Layout

Write a service that gets **open** PR's from a users github `Event`s. [This API](https://developer.github.com/v3/activity/events/) might help.

Then add `PullRequest`s to your `ApplicationState` and have it scheduled to refresh your state every minute.

Create a `PullRequestsLayout` that displays the title and a list of PR's from the `ApplicationState`.

Add two listeners for the `Next` and `Previous` the state of `PullRequest`s. The listeners should refresh the display after changing the state.

__Success Criteria:__ Displaying a list of PR's and being able to scroll through them with your joystick.
