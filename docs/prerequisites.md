#### Installing the Prerequisites
This Dev Day will require some prerequisite software.  When you first login you should be in your users home directory.  If you run `ls ~/` you will see a couple of script files ending in `.sh`  For now we will focus on `install.sh`.  This script pulls down and installs quite a lot of software that we'll need to either run our Micronaut projects or add some security on your Raspberry Pi.  This software includes:  `git`, `ufw`, `openjdk`, `python` and `wiringPi`.  In addition to software installation, it also pulls down an Adafruit project build specifically to show off the capabilities of the Bonnet screen connected to your Pi and enables and configures `ufw` or `Uncomplicated Firewall` only allowing connections to sshs default port of 22.

You'll need all of this to continue on with the `pi-naut` portion of the Dev Day so let's run it wit the following command: `sudo ./install.sh`.  This will take *awhile* so you can take this opportunity to move onto the [non-Pi Micronaut project](../README.md#exercises).  Make sure your leave this command running in a terminal.  Assuming this command completes successfully, you will see a cat on your screen.  Yay!


If for some reason you can't run the example script above, or you get any errors, curl up into a ball and wait until someone comes to your rescue.

Note:  From your home directory, you can also run `python Adafruit_Python_SSD1306/examples/buttons.py` after the install script runs. It will display some shapes on the screen that represent the bonnets built in Joystick and Buttons.  The screen should react to the button clicks and joystick movements you make.
