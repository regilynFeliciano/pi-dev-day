### Micronaut Exercise

We will be coding a very simple Github integration to demonstrate the core features of Micronaut.

* If you haven't already done so, install Micronaut with `brew install micronaut` or by [downloading](http://Micronaut.io/download.html) and using SDKMan.

* `cd` into your preferred development directory run `mn` to start Micronaut's interactive CLI.

* Create a new application to play with using the `create-app` command, and then cd into the project you created.

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
    user: <GITHUB_USER>
    token: <GITHUB_PERSONAL_ACCESS_TOKEN>
```

Now lets start making some basic microservice components.

* Using the CLI, create: 
    * A `GithubClient` - A declarative client interface that will be used to make calls to the official Github API.
    * A `GithubService` bean - A singleton service that transforms data from the `GithubClient`.
    * A `GithubController` - A REST controller to expose our `GithubService`.
    * A `GithubJob` - A scheduled job that will also use our `GithubService` (will be for used later for updating our Application state).

Once you have generated these components, create a `GithubClientConfiguration` class to allow Micronaut to use the credentials defined in `application.yml`. 
Just add the `@ConfigurationProperties` annotation with the appropriate application property prefix and declare the properties for your `user` and `token`.

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

__When all is said and done, run your application and ensure that your username gets displayed in the console every 10 seconds. You should also be able to hit your controller with postman and see the same result.__

### Relevant Micronaut docs

The components we covered only scratches the surface. Some other more common features that you will likely use with this framework include:

* [Bean Factories](https://docs.micronaut.io/latest/guide/index.html#factories)
* [Conditional Beans](https://docs.micronaut.io/latest/guide/index.html#conditionalBeans)
* [Lifecycle Methods](https://docs.micronaut.io/latest/guide/index.html#lifecycle)
* [Context Events](https://docs.micronaut.io/latest/guide/index.html#contextEvents)
* [Bean Events](https://docs.micronaut.io/latest/guide/index.html#events)
