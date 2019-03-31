# Pi Dev Day

## Pre-amble

__In this tutorialy you will need a [Rasberry Pi Zero](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and an [OLED bonnet](https://www.adafruit.com/product/3531) (or some input and LED display equivalent). The Adafruit Bonnet has a 128x64 pixel OLED display, a 5-button joystick, and 2 buttons.__

We will be using Java by leveraging [Pi4J](http://pi4j.com/) to access the GPIO (General Purpose I/O). What's more is that we are going to utilize some modern microservice patterns with [Micronaut](http://micronaut.io/). A Spring inspired full stack microservice framework designed for building lightweight applications.

Each Pi should already already been imaged with Raspian Lite (a headless Rasbian OS) and has all the necessary configuration and libraries to run a Java application.

__NOTE:__ You can re-image your Pi by running the `prepare.sh` and `install.sh` scripts found in the [pi-naut](https://github.com/jtoplak/pi-naut) repository. Detailed instructions can be found in the `README.md`.

## Getting Started

### Connect to your Pi

* Connect your Pi by plugging it into the INNER micro USB plug (the outer plug is a power supply only and should be used when not actively developing).

* `ssh` into `pi@<YOUR_DEFAULT_USER>`. The default username will be provided. The default password is `raspberry`.

* From your home directory, run `python Adafruit_Python_SSD1306/examples/buttons.py`. You should see shapes representing your joystick and buttons on the display and the display should respond when you press each button.

If for some reason you can't run the example script above, curl up into a ball and wait until someone comes to your rescue.

### Securing your Pi

It's important that your Pi is locked down and can only be accessed by your computer. That way, if someone were to steal your Pi they could not connect to it unless they wiped it. In addition, you can simply delete and re-generate your `Personal Access Token` (which you will setup shortly) in order to render the stolen Pi completely useless in the event of a theft. It's better to be safe than sorry... Don't forget what happened when [hitler used git](https://www.youtube.com/watch?v=CDeG4S-mJts)!

...WIP...
- add user.
- set password.
- delete default `pi` user.
- set up ssh key
...WIP...

### Micronaut Excercise

Before we dive into running code on our Pi, we need to understand how to use the framework. As an excercise, we will be coding a simple Github integration to demonstrate the core features of the framework.

* Create a [Personal Access Token](https://github.com/settings/tokens) with the following top level permissions:
  * repo
  * admin:org
  * notifications
  * user

* If you haven't already done so, install Micronaut with `brew install micronaut` or by [downloading](http://micronaut.io/download.html) and using SDKMan.

* `cd` into your preferred development directory run `mn` to start Micronaut's interactive CLI.

* Create a new application to play with using the `create-app` command, and then cd into it.

At this point you should be able to run your application from the command line with `./gradlew run`. You will see that out of the box it takes around 1.5 seconds to start an application. Very nice! Now let's add some configuration to our `application.yml`.

* In order to run the application in our IDE, nest a `server` -> `port` property under `micronaut` with some arbitrary port number.

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
    * A `GithubController` - A REST controller to expose our `GithubService` for another client to consume.
    * A `GithubJob` - A scheduled job that will also use our `GithubService` for updating our Application state.

Now create a `GithubClientConfiguration` class to allow micronaut to use the credentials defined in `application.yml` in the client. Just add the `@ConfigurationProperties` annotation and declare the properties for your `user` and `token`.

#### GithubClient

When you open the class you will notice that it is already annotated with `@Client` and that the client is an interface.

Start by adding `@Header`s on the interface to authenticate. The two required header `name`s are **User-Agent** and **Authorization**. The `value`s can be declared as an application property in a SpEL like fashion by using the `${}` notation.

__HINT:__ Github prefix's their tokens with 'token '.

* Our first client call will be to get the username from the Github API.

__IMPORTANT:__ You can pass annotated parameters into your interface methods such as `@QueryValue`, `@Valid`, `@Nullable`, `@CookieValue`, `@Body`, or `@Header`.

## Bringing It All Together

* Clone [this](https://github.com/jtoplak/pi-naut) seed project - `git clone https://github.com/jtoplak/pi-naut.git`.

* Add the same github configuration in the `application.yml` as you did in the micronaut excercise.

* In the root folder run `deploy.sh`. You should see the example application on your device.

* Refer to the pi-naut `README.md` for documentation on how to create your own layouts (skip the `Get Started` section).

## Choose Your Own Adventure!

* Contribute a custom integration to FCC's `pi-naut` repository. Your new device is your oyster! 
Get creative and implement something practical or fun that everyone can benefit from.

* Write an integration with the devlights client that changes the light in your pod **green** when a PR you contributed to get merged.

## Resources

* [GitHub API v3](https://developer.github.com/v3/)
* [Micronaut docs](https://docs.micronaut.io/latest/guide/index.html)
* Host your own [devlights](https://github.com/jtoplak/devlights) by cloning this repo.

If you are becoming a micronaut fan, there is a [Micronaut-Spring](https://github.com/micronaut-projects/micronaut-spring) project worth checking out that can be used to: 

* Integrate Spring components into a Micronaut application
* Run Spring applications as Micronaut applications
* Expose Micronaut Beans to a Spring Application
