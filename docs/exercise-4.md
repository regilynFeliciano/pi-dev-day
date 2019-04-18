### Exercise 4 - Pull Request Details Layout

Create a `PullRequestDetailsLayout` that displays the following information on your current `PullRequest`:

* Name
* Number
* Merge State

Now we need two listeners. One in the `PullRequestDetailsLayout` to navigate back to the `PullRequestLayout`, and one in the `PullRequestLayout` to navigate to the current `PullRequestDetailLayout`.

__Success Criteria:__ Being able to click into a PR and see it's details. 
You should also be able to navigate back to the list of PR's by clicking a button. 
This layout shoud NOT be displayed by cycling through layouts with your **joystick**.

__Bonus:__ Store the state of all the unique repositories amongst your PR's and display Repository info in the `PullRequestDetailsLayout`. 
