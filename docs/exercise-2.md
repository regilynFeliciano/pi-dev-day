### Exercise 2 - Devlight Layout

Configure the `DevlightClient` by adding a bean in `ApplicationConfiguration`.

__Note:__ You may be provided with a base uri to use for the client. If not, use the 2 arg constructor.

Your layout needs the following parts:

* A list of light states that you can scroll through and select from.

* Two listeners to goto the **next** and **previous** states of a list when you scroll **up** and **down** with the joystick.

* One listener that changes the devlight state to the selected light state when you click a button. 

__Note:__ If you are getting 404 - user not found exception, you need to be added to the devlight database.

__Hint:__ There is a `LightStateFactory` you can utilize or you can create custom light states with `HueConstants`. 

__Hint:__ If you make the listeners generic, you can use them for the next exercise :)

__Success Criteria:__ Display at least 5 `LightState`s that you can scroll through and select from. When you select a light state your hue bulb should respond with the intended state. At this point you should also be able to press on the **center joystick** to cycle through your primary layouts.
