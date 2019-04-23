### Setting up Wi-fi and Hostname

If your raspberry pi comes with built-in wifi hardware (these Pi Zeros do) you can use it to connect to any network.  In the case of Rasbian, it uses wpa_supplicant to interface with the WiFi hardware.  Rasbian comes with a user-friendly utility for this but we'll have to make some changes after due to the fact that we have a Hidden Wifi network that we'll be using.  In addition we'll be giving you the opportunity to change your hostname to something unique.

#### Changing Hostname
The hostname identifies your raspberry pi uniquely on the network (and subsequently, your local connection to it as well).  While it isn't strictly required to change your hostname, having multiple pis on the network with the same network name will cause issues with DNS.  To mitigate these issues you should change it to something unique.  Please remember your hostname!  Up until this point you've been connecting to your Raspberry Pi with ```ssh pi@raspberrypi.local```  but this will subsequently change to ```ssh pi@<your new hostname>.local``` after you make the host name change and reboot.

To change your host name run ```sudo raspi-config``` to enter into the Rasbian configuration utility.  This provides a variety of options but the only ones we will discuss right now are in the Network Options menu.  After running the above command, you'll be presented with a terminal GUI.  Use the arrow keys to navigate the menus and enter to make your selection.  Select the Network Options menu.

You should now see three options.  The first will be your Hostname setting.  Select it and follow the prompts to choose a unique hostname (ensuring that it follows the valid format as described in the prompt).

Once you finish setting it up, go to Finish.  It will ask you if you want to reboot - select Yes.  The system will now reboot with the new hostname you provided.  Remember that to log back in, your SSH command will now use your new hostname.

#### Turning on Wi-Fi
After logging into your Pi, run ```sudo raspi-config``` again.  This time we will configure the WiFi.  Select the Network Options menu again but this time go into the WiFI menu.  You'll be prompted for the SSID and subsequently the password.  Enter the SSID and Password provided to you and then Finish.  This time we do not want to reboot however.  We need to make some further configuration changes.

Because we're using a non-broadcasted Wi-Fi SSID, we need to make one extra configuration change so that the Pi can find the correct network.

Run ```sudo nano /etc/wpa_supplicant/wpa_supplicant.conf``` to open up the Wi-Fi configuration for editing.  You should see a ```network``` section now.  Create a newline under the ```psk=``` line and add the following:  ```scan_ssid=1```.  This configuration item tells the Pi to do a special scan for the network we've specified.  CTRL + O to write these changes out to the filesystem then run ```sudo reboot``` to trigger a reboot of the system.

#### Verify you have Internet
When the system comes up you should still be able to SSH into it as per normal, provided it's still connected to your machine.  You could also alternatively connect to it if you're on the same Wi-Fi network as we provided.

Run ```ifconfig``` to list the network interfaces and the IPs associated with them.  You should see an interface called ```wlan0``` that has an entry called ```inet``` with an IP Address after it.  **Note that this may take a minute or two for initial authentication with the Wi-Fi but it shouldn't take more than a few minutes.**  If it does not, verify that the password (psk) is correct in the ```wpa_supplicant.conf``` file.
