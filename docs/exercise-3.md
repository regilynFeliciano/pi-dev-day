### Exercise 3 - Pull Requests Layout

Write a service that gets **open** PR's associated to a user. Since PR's are resources for repositories you will have to find associated PR's either by the user's [events](https://developer.github.com/v3/activity/events/) or [notifications](https://developer.github.com/v3/activity/notifications/) API.

Then add `PullRequest`s to your `ApplicationState` and have it scheduled to refresh the state of your PR's every minute.

Create a `PullRequestsLayout` that displays the title and a list of PR's from the `ApplicationState`.

Add two listeners for the `Next` and `Previous` the state of `PullRequest`s. The listeners should refresh the display after changing the state.

__Hint:__ Don't forget that the pull requests that come back in the events or notifications payload will be a snapshot and will likely be out of date. The [pull request](https://developer.github.com/v3/pulls/) API might help :)

__Success Criteria:__ Displaying a list of open PR's and being able to scroll through them with your joystick.
