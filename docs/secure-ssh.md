### Securing the Pi

While there is no way to fully protect your Pi, we should do some things to mitigate some potential threats.  Note however that if someone were to take one of the SD card out of a Pi all of the secrets will be easily readable.  The easiest thing we can do is to keep your Pi in a secure environment.  In addition, the cases we will be using require the dismantling of the case before you can access the SD Card.

In this section we will make some configuration changes to increase the security of our Rapsberry Pis.  These changes will include, configuring SSH and related SSH Key, changing the default user password, and setting up a basic software firewall.

#### User Password
The very first thing we want to do is change the default password for the user.  The user ```pi``` has a default password of ```raspberry```.  This means that if anyone were to connect to the device, they would be able to login immediately.  Let's change that.  Run ```passwd``` and follow the prompts.  It will ask you for your current password, and then subsequently ask you to provide and confirm the new password.  Later we will be setting up an easier way to login, but make sure it's memorable.

#### SSH Key
SSH is a utility that allows you to connect to another machine through the network without necessarily having physical access to it.  It's how you're running commands on the Pi right now, in fact.  When you ran ```ssh raspberrypi.local``` it created an SSH connection to the Pi and prompted you to login.  But there's an easier and, if configured correctly, more secure way!  The SSH Key.  An SSH key is a means of identifying you or your machine to another host when connecting via SSH.  If the SSH Daemon on the host you're attempting to connect to knows your SSH Key, it'll let you log in without requiring a password.  SSH is like the bouncer at a super secret programming party, who only lets people in with the correct password.  But wait, you're the *hacker known as 4chan* and the bouncer knows you, so he just lets you walk on in.  That's what friends are for.  Let's make friends with our Raspberry Pis.

##### Step 1:  Check for Keys
If you have already used SSH Keys before, you might already have a key set up on your machine.  Run ```ls ~/.ssh```.  If it contains a file ending in ```.pub``` continue on to Step 3!  If not, we'll have to generate a key.

##### Step 2:  Generating a new Key
Run ```ssh-keygen```.  This command has a lot of features but for the purposes of this dev day, we'll keep it simple and stick with the defaults.  When prompted for a passphrase, you can either leave it blank (Enter) or enter in a password.  This passphrase will have to be entered in whenever the SSH Key will be used.  Now you should have two files in your ```~/.ssh``` folder, a file with a ```.pub``` extension and a file with the same name but no extension.  The file with no extension is your Private SSH Key.  Do not share, give, or otherwise divulge the file or any of its contents.  The ```.pub``` file is your Public Key and will be shared with other hosts, in this case, our Raspberry Pi.

##### Step 3:  Making Pi Friends
Now we can send your SSH key to your Pi which will allow us to connect without entering a password (on the Pi).  Run ```ssh-copy-id pi@raspberrypi.local```.  Now, the next time you to go SSH into your raspberry pi with the user of ```pi``` it'll use your SSH Key to log you in.

(Aside:  SD Cards can be encrypted in general but in this case the cards have two partitions, one being the Boot partition and the other being the actual root filesystem for the Pi operation system.  If we encrypted the root filesystem, the boot loader would have no way to decrypt it and our Pi would remain dead.  One could create a separate encrypted partition to store user files but this is out of the scope of this dev day).


#### Step 4: Secure SSH Daemon
Now that we have your SSH key on the Pi, we can make the SSH Daemon a little more secure, by disabling password logins.  It is *very* important that you ensure your SSH Key allows you to login to your Pi without entering in a password before running the following script.  If you have confirmed your SSH Key works, please run ```secure.sh```

This script disables Password Login and Root Login so the only way to login would be to login to your user with your SSH Key.
