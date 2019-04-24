### Exercise 4 - Pull Request Details Layout

Create a `PullRequestDetailsLayout` that displays the PR title and the following information on your **current** `PullRequest`:

* Number (int)
* Mergeable (boolean)
* Merge State (string description)
* Review Comments (int)

Now we need two listeners. One in the `PullRequestDetailsLayout` to navigate back to the `PullRequestLayout`, and one in the `PullRequestLayout` to navigate to the current `PullRequestDetailLayout`.

__Success Criteria:__ Being able to click into a PR and see it's details. 
You should also be able to navigate back to the list of PR's by clicking a button. 
This layout shoud NOT be displayed by cycling through layouts with your **joystick**.

__Bonus:__ Add an event to a button that will merge a PR if and only if it is mergeable. 
