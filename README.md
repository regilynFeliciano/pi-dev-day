# Pi Dev Day

## Pre-amble

__In this tutorialy you will need a [Rasberry Pi Zero](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and an [OLED bonnet](https://www.adafruit.com/product/3531) (or some input and LED display equivalent). The Adafruit Bonnet has a 128x64 pixel OLED display, a 5-button joystick, and 2 buttons.__

We will be using Java by leveraging [Pi4J](http://pi4j.com/) to access the GPIO (General Purpose I/O). What's even funky fresher is that we are going to utilize some modern microservice patterns with [Micronaut](http://Micronaut.io/). A Spring inspired full stack microservice framework designed for building lightweight applications.

Each Pi has been imaged with [Raspbian Lite](https://www.raspberrypi.org) and has all the necessary configuration and libraries to run a Java application.

You can image your Pi by running the `prepare.sh` and `install.sh` scripts found in the [pi-naut](https://github.com/jtoplak/pi-naut) repository. Detailed instructions can be found in the `README.md`.

## Getting Started

### Connect to your Pi

* Connect your Pi by plugging it into the INNER micro USB plug (the outer plug is a power supply only and should be used when not actively developing).

* `ssh` into `pi@<YOUR_DEFAULT_USER>`. The default username will be provided. The default password is `raspberry`.

* From your home directory, run `python Adafruit_Python_SSD1306/examples/buttons.py`. You should see shapes representing your joystick and buttons on the display and the display should respond when you press each button.

If for some reason you can't run the example script above, curl up into a ball and wait until someone comes to your rescue.

### Securing your Pi

It's important that your Pi is locked down and can only be accessed by your computer. That way, if someone were to steal your Pi they could not connect to it unless they wiped it. In addition, you can simply delete and re-generate your `Personal Access Token` (which you will setup shortly) in order to render the stolen Pi completely useless in the event of a theft. It's better to be safe than sorry... Don't forget what happened when [hitler used git](https://www.youtube.com/watch?v=CDeG4S-mJts)!

...WIP...

* add user.
* set password.
* delete default `pi` user.
* set up ssh key 

...WIP...

In addition to securing your Pi, you will need to generate a [Personal Access Token](https://github.com/settings/tokens) with the following permissions:
* repo
* admin:org
* notifications
* user

### Micronaut Warm Up

Before we dive into running code on our Pi, we need to understand how to use the framework. 
As an excercise, we will be coding a very simple Github integration to demonstrate the core features of Micronaut.

* If you haven't already done so, install Micronaut with `brew install Micronaut` or by [downloading](http://Micronaut.io/download.html) and using SDKMan.

* `cd` into your preferred development directory run `mn` to start Micronaut's interactive CLI.

* Create a new application to play with using the `create-app` command, and then cd into it.

At this point you should be able to run your application from the command line with `./gradlew run`. You will see that out of the box it takes around 1.5 seconds to start an application. Very nice! Now let's add some configuration to our `application.yml`.

* In order to run the application in our IDE, nest a `server` -> `port` property under `Micronaut` with some arbitrary port number.

* To use the github client with our credentials, add a `github` config with `user` and `token` properties

When all is said and done your `application.yml` should look something like this:

```yaml
micronaut:
    application:
        name: <APP_NAME>
    server:
        port: <PORT>

github:
    user: <USER>
    token: <TOKEN>
```

Now lets start making some basic microservice components.

* Using the CLI, create: 
    * A `GithubClient` - A declarative client interface that will be used to make calls to the official Github API.
    * A `GithubService` bean - A singleton service that transforms data from the `GithubClient`.
    * A `GithubController` - A REST controller to expose our `GithubService`.
    * A `GithubJob` - A scheduled job that will also use our `GithubService` (will be for used later for updating our Application state).

Once you have generated these components, create a `GithubClientConfiguration` class to allow Micronaut to use the credentials defined in `application.yml` in the client. 
Just add the `@ConfigurationProperties` annotation with the appropriate prefix and declare the properties for your `user` and `token`.

#### GithubClient

When you open the class you will notice that it is already annotated and that the client is an interface.

Start by adding `@Header`s on the interface to authenticate. The two required header `name`s are **User-Agent** and **Authorization**. 
The `value`s can be declared as application properties in a SpEL like fashion by using the `${}` notation.

__HINT:__ Github prefix's their tokens with 'token '.

Now add a `@Get` method for returning the current `User`. You can refer to the [user docs](https://developer.github.com/v3/users/) to find the endpoint you need.

__FYI:__ You can also add annotations to your client methods (like `@Header`) or pass annotated parameters such as `@Body`, `@CookieValue`, `@QueryValue`, `@Valid`, or `@Nullable`.

#### GithubService

`@Inject` the `GithubClient` and create a method to return the current user's name.

#### GithubJob

`@Inject` the `GithubService` and use it to print out the name of the user on the console every `10 seconds`.

#### GithubController

`@Inject` the `GithubService` and expose a `@Get` endpoint to return the current user's name.

#
When all is said and done, run your application and ensure that your username gets displayed in the console every 10 seconds. You should also be able to hit your controller and see the same result.
#

### Worthy Micronaut docs

This exercise is intended to get you familiarized with Micronaut and only scratches the surface. 
Some of the more notable features that you may likely use when programming your Pi include:

* [Bean Factories](https://docs.micronaut.io/latest/guide/index.html#factories)
* [Conditional Beans](https://docs.micronaut.io/latest/guide/index.html#conditionalBeans)
* [Lifecycle Methods](https://docs.micronaut.io/latest/guide/index.html#lifecycle)
* [Context Events](https://docs.micronaut.io/latest/guide/index.html#contextEvents)
* [Bean Events](https://docs.micronaut.io/latest/guide/index.html#events)

## Pi-Naut Exercises

* Clone [this seed](https://github.com/jtoplak/pi-naut) and checkout the `oled-bonnet-seed` branch.

* Add the same github configuration in the `application.yml` as you did in the Micronaut Warm Up.

* Read the `Development Workflow` and `How to use` sections of the pi-naut `README.md` before you start the following exercises.

__HINT:__ There are `DisplayComponents` that you can use to buffer basic components such as titles and lists for the following exercises.

### Exercise 1 - Runtime Stats Layout

Create a `RuntimeStatsLayout` that displays the title and the following stats on the display:

* Available processors
* Free memory
* Max memory
* Total memory

Then add it to the `primaryLayouts` in the `LayoutFactory`.

__Bonus:__ Make the display refresh every second rather than when you initially switch to the layout.

__Success Criteria:__ Displaying a screen with all the above runtime stats.

### Exercise 2 - Pull Requests Layout

Write a service that gets **open** PR's from a users github `Event`s. [This API](https://developer.github.com/v3/activity/events/) might help.

Then add a `StateList` of `PullRequest`s to your `ApplicationState` and have it scheduled to refresh your state every minute by calling your service.

Create a `PullRequestsLayout` that displays the title and a list of PR's from the `ApplicationState`. Some basic `DisplayCompoents` have been provided for you :)

Add two listeners that `Increment` and `Decrement` the state of `PullRequest`s. The listeners should refresh the display after incrementing/decrementing the state.

__Hint:__ Custom listeners implement `GpioPinListenerDigital`.

__Hint:__ Take the `PinState` into account on the `GpioPinDigitalStateChangeEvent` when handling the change event, or you may run your code multiple times!

__Success Criteria:__ Displaying a list of PR's and being able to scroll through them with your joystick. 
At this point you should also be able to press on the **Center Joystick** to cycle through your parent layouts.

### Exercise 3 - Pull Request Details Layout

Create a `PullRequestDetailsLayout` that displays the following information on your current `PullRequest`:

* Name
* Number
* Merge State

Add the layout to `secondaryLayouts` in the `LayoutFactory`.

Now we need two listeners. One in the `PullRequestDetailsLayout` to navigate to the **current primary layout**, and one in the `PullRequestLayout` to navigate to the current pull request details.

__Bonus:__ Store the state of all the unique repositories amongst your PR's and display Repository info in the `PullRequestDetailsLayout`. 

__Success Criteria:__ Being able to click into a PR and see it's details. You should also be able to navigate back to the list of PR's by clicking a button.

### Exercise 4 - Devlight Layout

... WIP ...

## Choose Your Own Adventure!

* Contribute a custom feature branch! Implement something practical or

* Write an integration with the devlights client that changes the light in your pod **green** when a PR you contributed to get merged.

... WIP ...

## Other Resources`

* [GitHub API v3](https://developer.github.com/v3/)
* [Micronaut docs](https://docs.Micronaut.io/latest/guide/index.html)
* [Devlights source code](https://github.com/jtoplak/devlights)

If you Spring chickens are becoming Micronaut fans, there is a [Micronaut-Spring](https://github.com/Micronaut-projects/Micronaut-spring) project worth checking out that can be used to: 

* Integrate Spring components into a Micronaut application
* Run Spring applications as Micronaut applications
* Expose Micronaut beans to a Spring application
