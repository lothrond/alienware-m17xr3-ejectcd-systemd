alienware-m17xr3-ejectcd-systemd
================================

Fix the ejectcd button on Alienware M17xR3 laptops using systemd.

## Info

This is a patch that will get you commit `cfd54b6` of systemd.

At the time of this writing, this commit is only in the `master` branch, and the latest systemd release is v244. 

Meaning, If you would like your button to work right now, apply this patch.

## Installation

### Makefile installation

(May not work for all distributions).

apply patch:

    sudo make apply

remove patch:

	sudo make remove

### Manual installation

This patch can be applied to `60-keyboard.hwdb` (i.e. `/lib/udev/hwdb.d/60-keyboad.hwdb`)
by issuing something like: 
    
	sudo patch /lib/udev/hwdb.d/60-keyboard.hwdb /path/to/60-keyboard.hwdb.alienware-M17xR3.patch

After applying the patch, dont forget to update your `hwdb.bin` by issuing something like:

    sudo systemd-hwdb update
    sudo udevadm trigger /dev/input/event4

(Check with your distribution for information on reloading this database, as these commmands may be different).

Now, to see if the patch applied correctly, one can issue something like:

	sudo udevadm test /sys/class/input/event4 | grep KEYBOARD_KEY_89

Or press the button, it should now work as expected.

If you wish to remove this patch, issue something like:

	sudo patch -R /lib/udev/hwdb.d/60-keyboard.hwdb /path/to/60-keyboard.hwdb.alienware-M17xR3.patch
