### Exercise 3 - Pull Request Details Layout

Create a `PullRequestDetailsLayout` that displays the following information on your current `PullRequest`:

* Name
* Number
* Merge State

Add the layout to `secondaryLayouts` in the `LayoutFactory`.

Now we need two listeners. One in the `PullRequestDetailsLayout` to navigate to the **current primary layout**, and one in the `PullRequestLayout` to navigate to the current pull request details.

__Bonus:__ Store the state of all the unique repositories amongst your PR's and display Repository info in the `PullRequestDetailsLayout`. 

__Success Criteria:__ Being able to click into a PR and see it's details. You should also be able to navigate back to the list of PR's by clicking a button.
