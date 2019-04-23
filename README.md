# Pi Dev Day

### Pre-amble

__In this tutorial you will need a [Rasberry Pi Zero](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and an [OLED bonnet](https://www.adafruit.com/product/3531) (or some input and LED display equivalent). The Adafruit Bonnet has a 128x64 pixel OLED display, a 5-button joystick, and 2 buttons.__

We will be using Java by leveraging [Pi4J](http://pi4j.com/) to access the GPIO (General Purpose I/O). What's even funky fresher is that we are going to utilize some modern microservice patterns with [Micronaut](http://Micronaut.io/). A Spring inspired full stack microservice framework designed for building lightweight applications.

Each Pi has been imaged with [Raspbian Lite](https://www.raspberrypi.org) and has all the necessary configuration and libraries to run a Java application (you can skip **Preparing your SD Card**).

### Getting Started
Steps marked with `*` are required for the project if you're doing it from scratch but are **optional** for this Dev Day as they will already be performed for you.

* [Preparing your SD Card](docs/prepare-sd.md)`*` - How to create an SD card for this project.
* [First Steps](docs/first-steps.md) - Connecting to and setting up your Pi
* [Setup Wi-Fi](docs/wifi.md) - Configure your Wi-Fi
* [Installing the Pre-requisites](docs/prerequisites.md)`*` - Installing the Pre-requisite Software
* [Securing Your Pi](docs/secure-ssh.md) - Lock down your Pi

### Github Personal Access Token

In addition to securing your Pi, you will need to generate a [Personal Access Token](https://github.com/settings/tokens) with the following permissions enabled:
* repo
* admin:org
* notifications
* user

A Personal Access Token is an API key that let's you access Github data programatically. It will be used for the following Github integration.

### Exercises

Although Micronaut applications have fast startup times (~1.5s), starting a Java application on a Pi does take more time (~20s on a Pi Zero and ~8s on a Pi 3B+).
In addition `Pi4J` uses `WiringPi` under the covers (a python library for accessing the GPIO on DSM devices), and will likely not run on your local machine.

As such, start with this [Micronaut Exercise](docs/micronaut-exercise.md) and create an application from scratch with the Micronaut CLI before you start developing on your Pi's.

Once you are comfortable with how to use Micronaut it's time to put the two together!

* Clone [this seed project](https://github.com/jtoplak/pi-naut) and checkout the `oled-bonnet-seed` branch.

* Add the same github configuration in the `application.yml` as you did in the Micronaut Warm Up.

* Read the [Development Workflow](https://github.com/jtoplak/pi-naut/blob/master/docs/workflow.md) and [How to Use](https://github.com/jtoplak/pi-naut/blob/master/docs/how-to-use.md) sections before you start the following exercises.

Complete the following exercises in order:

[Exercise 1](docs/exercise-1.md) - Runtime stats layout

[Exercise 2](docs/exercise-2.md) - Devlight layout

[Exercise 3](docs/exercise-3.md) - Pull Requests layout

[Exercise 4](docs/exercise-4.md) - Pull Request Detail layout

#### Resources

* [GitHub API v3](https://developer.github.com/v3/)
* [Micronaut docs](https://docs.Micronaut.io/latest/guide/index.html)
* [Devlights source code](https://github.com/jtoplak/devlights)

### Choose Your Own Adventure!

* Implement a layout that tickles your fancy! Make a branch for your feature so that it can be easily merged.

* Write an integration with the devlights client that changes the light in your pod when a PR you contributed to gets approved, merged, and/or closed.

* Create a PR feedback feature that displays an alert for you to re-check a PR when a `PushEvent` happens after you have **requested changes** on a PR.

**Whoever contributes the best Pi feature(s) will win a [Circuit Playground Express](https://www.adafruit.com/product/3333)! Submissions will be judged by creativity, completeness, relevance, and overall awesomeness!**

### Fin

If you Spring chickens are becoming Micronaut fans, there is a [Micronaut-Spring](https://github.com/Micronaut-projects/Micronaut-spring) project worth checking out that can be used to:

* Integrate Spring components into a Micronaut application
* Run Spring applications as Micronaut applications
* Expose Micronaut beans to a Spring application
