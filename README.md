Linux XPS13 Arch Linux
======================

This is a custom Linux kernel build for Arch Linux based on the [Arch Build System](https://wiki.archlinux.org/index.php/Arch_Build_System) [PKGBUILD](https://wiki.archlinux.org/index.php/PKGBUILD). It contains a patch for the Dell XPS 13 (L321x and L322x) touchpad (**cypress_ps2**) that enables the use of [Touchégg](https://code.google.com/p/touchegg/) for gesture recognition. The patch was sourced from a diff of the Arch Linux kernel source and the Ubuntu kernel source (which has patches that have not been mainlined) for the **cypress_ps2** driver.  

Currently this allows for recognition of 2, 3 and 4 finger swipe gestures in the vertical and horizontal and application specific gestures through [Touchégg](https://code.google.com/p/touchegg/).

This may also work on other hardware that had the same or similar touchpad but this is only tested on the Dell XPS 13 L322x (Note: XPS 13 9993 uses the Synaptic touchpad driver).

Requirements
============

To install this kernel, ensure that you have the following:

* Arch Linux installed (on a machine that uses the **cypress_ps2** driver)
* [base-devel](https://www.archlinux.org/groups/x86_64/base-devel/) packages installed
* a AUR Helper like [Yaourt](https://wiki.archlinux.org/index.php/yaourt) or [Aura](https://wiki.archlinux.org/index.php/aura) (optional)
* [modprobe-db](https://wiki.archlinux.org/index.php/Modprobed_db) (optional, support coming soon!)

If you would just like to patch your own kernel on Arch or any other distribution, use the **xps13.patch** file to patch your kernel before you build it. Note that the instructions below are Arch Linux specific and will have to be adapted for other distributions.

Usage
=====

Manual Install
--------------

### Aquire the Source

There are two methods for acquiring the source:

From **Github**:

	$ git clone https://github.com/gunzy83/linux-xps13-archlinux.git
	$ cd linux-xps13-archlinux

From the **AUR**:

	$ curl -O https://aur.archlinux.org/packages/li/linux-xps13/linux-xps13.tar.gz
	$ tar -xf linux-xps13.tar.gz
	$ cd linux-xps13

You are now ready to build the kernel.

### Build the Kernel

To build the kernel run the following command:

	$ makepkg -s

The *-s* option means that makepkg will call pacman to download and install dependencies as root.

### Install the Kernel

Install the custom kernel with docs and header files:

	$ pacman -U *.pkg.tar.xz

See the documentation for your [bootloader](https://wiki.archlinux.org/index.php/Boot_loaders) to add a new entry for this kernel.

Automated Install
-----------------

You can install the custom kernel in one step using an [AUR Helper](https://wiki.archlinux.org/index.php/AUR_Helpers) like [Yaourt](https://wiki.archlinux.org/index.php/yaourt) or [Aura](https://wiki.archlinux.org/index.php/aura).

### Yaourt

	$ yaourt -S linux-xps13

### Aura
	
	$ aura -Ax linux-xps13

Remember that even with this method you still need to update your [bootloader](https://wiki.archlinux.org/index.php/Boot_loaders) to add a new entry for this kernel.

Set up Synaptics and Touchégg
-----------------------------

To make use of the patch included installation and configuration of Synaptics and Touchégg is required.

Install the following packages and dependencies as required:

* xf86-input-synaptics (pacman)
* touchegg (AUR)

The standard configuration file provided by xf86-input-synaptics captures certain events when using 2 and 3 fingers and prevents them from registering with Touchégg. The following is a section of my **/etc/X11/xorg.conf.d/50-synaptics.conf** file that allows 2 and 3 finger gestures to register in Touchégg (and some tweaks that improve behaviour of the trackpad):

	...
	Section "InputClass"
		Identifier "touchpad catchall"
		Driver "synaptics"
		MatchIsTouchpad "on"
		Option "CircularScrolling" "0"
		Option "Protocol" "event"
		Option "FingerLow" "10"
		Option "FingerHigh" "40"
		Option "MinSpeed" "0.4"        
		Option "MaxSpeed" "2"
		Option "AccelFactor" "0.8"
		Option "EmulateTwoFingerMinW" "8" 
		Option "EmulateTwoFingerMinZ" "10"
		Option "HorizScrollDelta" "100"
		Option "VertScrollDelta" "15"
		Option "TapButton1" "1"
		Option "PalmDetect" "1"
		Option "AreaRightEdge" "1020"
		Option "AreaTopEdge" "40"
		Option "FastTaps" "0"
		Option "MaxTapTime" "100"
		Option "TapButton2" "0"
		Option "TapButton3" "0"
		Option "ClickFinger2" "0"
		Option "ClickFinger3" "0"
		Option "HorizTwoFingerScroll" "0"
		Option "VertTwoFingerScroll" "0"
		MatchDevicePath "/dev/input/event*"
	EndSection
	
	...

Copy the Touchégg configuration file to the correct location in your home directory.

	$ mkdir -p ~/.config/touchegg
	$ cp /usr/share/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf

From here you have to tailor your configuration file and desktop environment shotcuts to perform the desired action when you perform a gesture. See the official Touchégg Wiki for details: [https://code.google.com/p/touchegg/wiki/Main](https://code.google.com/p/touchegg/wiki/Main)

Why this works
==============

The standard cypress_ps2 driver identifies itself as a Semi-multitouch device but Ubuntu it was patched to identify as a full multitouch device and can detect horizontal and vertical swipes with 2-4 fingers.

Future Plans
============

* Improve gesture recognition accuracy for non-swipe gestures.
* Add further patches specific to optimising Arch Linux on the Dell XPS 13 (may not be touchpad related).
* Investigate possibility of getting the patch accepted upstream.

License
=======

linux-xps13-archlinux is provided under the terms of [GNU GENERAL PUBLIC LICENSE Version 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)

Copyright &copy; 2014, [Ross Williams](mailto:gunzy83au@gmail.com)

