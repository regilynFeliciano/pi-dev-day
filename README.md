# Pi Dev Day

### Pre-amble

__In this tutorial you will need a [Rasberry Pi Zero](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and an [OLED bonnet](https://www.adafruit.com/product/3531) (or some input and LED display equivalent). The Adafruit Bonnet has a 128x64 pixel OLED display, a 5-button joystick, and 2 buttons.__

We will be using Java by leveraging [Pi4J](http://pi4j.com/) to access the GPIO (General Purpose I/O). What's even funky fresher is that we are going to utilize some modern microservice patterns with [Micronaut](http://Micronaut.io/). A Spring inspired full stack microservice framework designed for building lightweight applications.

Each Pi has been imaged with [Raspbian Lite](https://www.raspberrypi.org) and has all the necessary configuration and libraries to run a Java application (you can skip **Preparing your SD Card**).

### Getting Started with the Pi
Steps marked with `*` are required for the project if you're doing it from scratch but are **optional** for this Dev Day as they will already be performed for you.

* [Preparing your SD Card](docs/prepare-sd.md)`*` - How to create an SD card for this project.
* [First Steps](docs/first-steps.md) - Connecting to and setting up your Pi
* [Setup Wi-Fi](docs/wifi.md) - Configure your Wi-Fi
* [Installing the Pre-requisites](docs/prerequisites.md)`*` - Installing the Pre-requisite Software
* [Securing Your Pi](docs/secure-ssh.md) - Lock down your Pi

### Github Personal Access Token

In addition to setting up and securing your Raspberry Pi, you will need to generate a [Personal Access Token](https://github.com/settings/tokens) with the following permissions enabled:
* repo
* admin:org
* notifications
* user

A Personal Access Token is an API key that let's you access Github data programatically. It will be used for the following Github integration.

### Exercises

Although Micronaut applications have fast startup times (~1.5s), starting a Java application on a Pi will take more time than usual (~20s on a Pi Zero and ~8s on a Pi 3B+).
In addition, `Pi4J` uses `WiringPi` under the covers (a python library for accessing the GPIO on DSM devices) and cannot be installed on your local machine.
As such, we will how to use the framework locally before we start developing on our Pi's.

Do this [Micronaut Exercise](docs/micronaut-exercise.md) and create an application from scratch using the Micronaut CLI. 
If you get stuck, the solution to the exercise is the project included in this repository.

Once you are comfortable with how to use Micronaut it's time to put the two together!

* Fork [this](https://github.com/jtoplak/pi-naut) seed project and checkout the `oled-bonnet-seed` branch.

* Add the same github configuration in the `application.yml` as you did in the Micronaut Warm Up.

* Read the [Development Workflow](https://github.com/jtoplak/pi-naut/blob/master/docs/workflow.md) and [How to Use](https://github.com/jtoplak/pi-naut/blob/master/docs/how-to-use.md) sections before you start the following exercises.

Complete the following exercises in order:

[Exercise 1](docs/exercise-1.md) - Runtime stats layout

[Exercise 2](docs/exercise-2.md) - Devlight layout

[Exercise 3](docs/exercise-3.md) - Pull Requests layout

[Exercise 4](docs/exercise-4.md) - Pull Request Details layout

#### Resources

* [GitHub API v3](https://developer.github.com/v3/)
* [Micronaut docs](https://docs.Micronaut.io/latest/guide/index.html)
* [Devlights source code](https://github.com/jtoplak/devlights)

### Choose Your Own Adventure!

Choose one of the following adventures:

1. Create a layout or feature that others can use and push it to a feature branch. If you can't think of anything, here are some pre-curated ideas.

    * Create a basic weather layout. If that isn't fancy enough, you could use a lookup for location by IP, or make it configurable for multiple locations... or both!

    * Enhance the open Pull Requests feature by creating an alert that temporarily displays the event that occurred on that PR.

    * Add a **Review Requested** layout that displays a list of PR's that you have been requested to review. If you think that is child play, enhance it by:
    
        * Making a PR feedback feature that displays an alert for you to re-check a PR when a `PushEvent` or `CommentEvent` happens after you have **requested changes**.
        
        * Create a feature that lets you approve a PR by clicking a button. In other words, an insta-approved button!

2. Use the Pi to automate your devlight without having to click a button. You could:

    * Write an integration that changes the light in your pod when a PR gets approved, merged, and/or closed.

    * Hook into some other API that changes your teams devlight on some event.
    
3. Stop doing anything Micronaut or Java related and do something cool that you can show or share.

**The best overall contribution will win a [Circuit Playground Express](https://www.adafruit.com/product/3333)! Submissions will be judged by completeness and overall usefulness/awesomeness. If there is a tie, the winner will be decided by popular vote!**

### Fin

If you Spring chickens are becoming Micronaut fans, there is a [Micronaut-Spring](https://github.com/Micronaut-projects/Micronaut-spring) project worth checking out that can be used to:

* Integrate Spring components into a Micronaut application
* Run Spring applications as Micronaut applications
* Expose Micronaut beans to a Spring application
