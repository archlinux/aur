'\" t -*- coding: us-ascii -*-
.if \n(.g .ds T< \\FC
.if \n(.g .ds T> \\F[\n[.fam]]
.de URL
\\$2 \(la\\$1\(ra\\$3
..
.if \n(.g .mso www.tmac
.TH "xboxdrv " 1 2011-07-20 0.8.3 "User Commands"
.SH NAME
xboxdrv
\- A Xbox/Xbox360 gamepad driver that works in userspace 
.SH SYNOPSIS
'nh
.fi
.ad l
\fBxboxdrv\fR \kx
.if (\nx>(\n(.l/2)) .nr x (\n(.l/5)
'in \n(.iu+\nxu
[OPTION]\&... [--] [COMMAND] [ARGUMENTS]
'in \n(.iu-\nxu
.ad b
'hy
.SH DESCRIPTION
\fBxboxdrv\fR is a driver for Xbox and Xbox360
gamepads. It works by reading the raw data from the controller
with the userspace library libusb and then passes the
interpreted data to the kernel via uinput. This
allows \fBxboxdrv\fR to provide regular joystick
and event devices, which makes it compatible with all Linux
software.
.PP
Aside from the pure driver, \fBxboxdrv\fR also
includes a rich set of configuration options that allow you to
tweak the abilities of the virtual input devices that xboxdrv
will create. This includes basic button and axis remapping, as
well as more complicated things like mouse and keyboard emulation,
auto-fire and throttle control emulation.
.PP
It is also possible for \fBxboxdrv\fR to read input
data directly from an event device, this allows the use of the
configurability of \fBxboxdrv\fR on regular PC
joysticks, keyboards and mice and thus
lets \fBxboxdrv\fR serve a similar purpose
as \fBjoy2key\fR. See the
option \*(T<\fB\-\-evdev\fR\*(T> below for more information.
.PP
When a \*(T<\fBCOMMAND\fR\*(T> is provided xboxdrv will launch
that application and be running till that application exits.
This is a convenience function to make it easier to use xboxdrv
in wrapper scripts. See the section
[Writing Start-Up Scripts for Games]
for more information.
.SH OPTIONS
.SS "GENERAL OPTIONS"
.TP 
\*(T<\fB\-h\fR\*(T>, \*(T<\fB\-\-help\fR\*(T>
Display help text and exit.
.TP 
-V, --version
Print the version number and exit.
.TP 
\*(T<\fB\-v\fR\*(T>, \*(T<\fB\-\-verbose\fR\*(T>
Print verbose messages.
.TP 
\*(T<\fB\-\-debug\fR\*(T>
Print even more verbose messages then \*(T<\fB\-\-verbose\fR\*(T>.
.TP 
\*(T<\fB\-s\fR\*(T>, \*(T<\fB\-\-silent\fR\*(T>
Do not display controller events on the terminal. For
regular use this option should always be used as output
data to the terminal can eat up quite a bit of CPU.
.TP 
\*(T<\fB\-\-quiet\fR\*(T>
Do not display startup text and suppress most other output.
.TP 
\*(T<\fB\-\-priority\fR\*(T> \fIPRIORITY\fR
Possible values for \fIPRIORITY\fR
are "normal" and "realtime". Realtime scheduling gives
the xboxdrv process higher priority and thus allows it
to function properly even when the machine is under
load.

Note that realtime priority requires running xboxdrv as
root, when running xboxdrv as user there is no way to
increase the priority.

This option is deprecated,
use \fBchrt\fR(1)
instead to achive the same effect.
.SS "LIST OPTIONS"
.TP 
\*(T<\fB\-\-help\-led\fR\*(T>
List possible values for the led.
.TP 
\*(T<\fB\-\-help\-devices\fR\*(T>
List supported devices.
.TP 
\*(T<\fB\-\-list\-supported\-devices\fR\*(T>
List supported devices (used by xboxdrv-daemon.py).
.TP 
\*(T<\fB\-\-list\-supported\-devices\-xpad\fR\*(T>
List supported devices in \*(T<\fIxpad.c\fR\*(T> style.
.TP 
\*(T<\fB\-\-help\-abs\fR\*(T>
List all allowed EV_ABS symbols.
.TP 
\*(T<\fB\-\-help\-rel\fR\*(T>
List all allowed EV_REL symbols.
.TP 
\*(T<\fB\-\-help\-key\fR\*(T>
List all allowed EV_KEY symbols.
.TP 
\*(T<\fB\-\-help\-x11keysym\fR\*(T>
List all allowed X11 Keysym symbols.
.TP 
\*(T<\fB\-\-help\-axis\fR\*(T>
List all allowed XboxAxis symbols.
.TP 
\*(T<\fB\-\-help\-button\fR\*(T>
List all allowed XboxButton symbols.
.TP 
\*(T<\fB\-\-help\-all\fR\*(T>
List all symbols that can be used
in \*(T<\fB\-\-ui\-buttonmap\fR\*(T>, \*(T<\fB\-\-ui\-axismap\fR\*(T>, \*(T<\fB\-\-buttonmap\fR\*(T>
and \*(T<\fB\-\-axismap\fR\*(T>. This option is the same as
\*(T<\fB\-\-help\-abs\fR\*(T>,
\*(T<\fB\-\-help\-rel\fR\*(T>,
\*(T<\fB\-\-help\-key\fR\*(T>,
\*(T<\fB\-\-help\-x11keysym\fR\*(T>,
\*(T<\fB\-\-help\-axis\fR\*(T> and
\*(T<\fB\-\-help\-button\fR\*(T>.
.SS "CONFIG FILE OPTIONS"
.TP 
\*(T<\fB\-c\fR\*(T>, \*(T<\fB\-\-config\fR\*(T> \fIFILE\fR
Reads configuration information from \fIFILE\fR.
Configurations from file are handling as if they would
be command line options at the position
of \*(T<\fB\-\-config\fR\*(T> \fIFILE\fR.

The syntax
of \fIFILE\fR is
the familiar INI syntax used for many configuration
files. Regular key/value pairs must go into the
[xboxdrv] section. '#' and ';' can be used for comments.
Key names have for most part the same name as command
line options. Command line options that take a list of
input mappings (--ui-buttonmap, --ui-axismap,
--evdev-absmap, ...) can be split of into their own
section for better readability.

The \*(T<\fIexamples/\fR\*(T> directory contains
some example configuration files.

.nf
\*(T<[xboxdrv]
silent=true
deadzone=6000
dpad\-as\-button=true
trigger\-as\-button=true

[ui\-axismap]
x2=REL_X:10
y2=REL_Y:\-10
x1=KEY_A:KEY_D
y1=KEY_W:KEY_S

[ui\-buttonmap]
a=KEY_LEFTSHIFT
b=BTN_C
x=BTN_EXTRA
y=KEY_C

[ui\-buttonmap]
lb=BTN_RIGHT
rb=KEY_SPACE

[ui\-buttonmap]
lt=KEY_Z
rt=BTN_LEFT

[ui\-buttonmap]
dl=KEY_4
dr=KEY_2
du=REL_WHEEL:\-1:150
dd=REL_WHEEL:1:150

[ui\-buttonmap]
back=KEY_TAB
start=KEY_ESC

# EOF #\*(T>
.fi
.TP 
\*(T<\fB\-\-alt\-config\fR\*(T> \fIFILE\fR
A shortcut for
writing \*(T<\fB\-\-next\-config\fR\*(T> \*(T<\fB\-\-config\fR\*(T> \fIFILE\fR.

To load multiple configuration options use:

.nf
\*(T<xboxdrv \-\-config first.ini \-\-alt\-config second.ini \-\-alt\-config third.ini\*(T>
.fi
.TP 
\*(T<\fB\-o\fR\*(T>, \*(T<\fB\-\-option\fR\*(T> \fINAME=VALUE\fR
Set an option as if it would come from a config file from the command line.
.TP 
\*(T<\fB\-\-write\-config\fR\*(T> \fIFILE\fR
Write an example configuration file to \fIFILE\fR.
.SS "DAEMON OPTIONS"
.TP 
\*(T<\fB\-D\fR\*(T>, \*(T<\fB\-\-daemon\fR\*(T>
Run xboxdrv as daemon. If this option is given xboxdrv
will listen to udev for USB connection events and launch
driver threads for newly connected controllers.

Configuration options can still be supplied as usual.
Note however that xboxdrv when run as daemon will not
create new uinput devices on demand, instead it will
only create devices once at startup for the given
configurations and then assign new controllers to these
configurations. While this means xboxdrv can't support
an unlimited number of controllers, it also means that
xboxdrv can allow hot plugging even for applications
that don't support it themselves, as applications will
only see the permanent device files, not the controller
that xboxdrv will change around under the hood.

An example configuration that supports three controller
would look like this:

.nf
\*(T<xboxdrv \-\-daemon \e
    # config options for the first controller
  \-\-next\-controller \e
    # config options for the second controller
  \-\-next\-controller
    # config options for the third controller\*(T>
.fi

The \*(T<\fB\-\-match\fR\*(T> option can be used to limit
the controller slots to only those controllers that
match the given RULE and thus be used to assign
configurations only to specific controllers.
.TP 
\*(T<\fB\-\-detach\fR\*(T>
Detaches xboxdrv from the current shell, only valid
if \*(T<\fB\-\-daemon\fR\*(T> is given.
.TP 
\*(T<\fB\-\-pid\-file\fR\*(T> \fIFILE\fR
Write the xboxdrv daemon process id to FILE.
.TP 
\*(T<\fB\-\-dbus\fR\*(T> \fIBUS\fR
Set which bus type xboxdrv should connect to. Allowed
values for BUS are session,
system,
disabled and
auto. The default is
auto, which will detect the
appropriate bus type depending on if xboxdrv is run as
root (system or as user
(session). Running with
disabled will disable D-Bus support
completely.
.TP 
\*(T<\fB\-\-on\-connect\fR\*(T> \fIEXE\fR
Launches \fIEXE\fR
when a controller gets connected. As arguments
"\fIBUSDEV\fR:\fIDEVNUM\fR",
"\fIidVendor\fR:\fIidProduct\fR",
"\fINAME\fR are provided.
.TP 
\*(T<\fB\-\-on\-disconnect\fR\*(T> \fIEXE\fR
Launches \fIEXE\fR
when a controller gets disconnected. As arguments
"\fIBUSDEV\fR:\fIDEVNUM\fR",
"\fIidVendor\fR:\fIidProduct\fR",
"\fINAME\fR are provided.
.SS "DEVICE OPTIONS"
.TP 
\*(T<\fB\-L\fR\*(T>, \*(T<\fB\-\-list\-controller\fR\*(T>
List available controllers on the system.
.TP 
\*(T<\fB\-i\fR\*(T>, \*(T<\fB\-\-id\fR\*(T> \fIN\fR
Use controller with id N (default: 0),
use \*(T<\fB\-\-list\-controller\fR\*(T> to obtain a list
of available controller.
.TP 
\*(T<\fB\-w\fR\*(T>, \*(T<\fB\-\-wid\fR\*(T> \fIN\fR
Use wireless controller with wid N (default: 0).
.TP 
\*(T<\fB\-\-device\-by\-path\fR\*(T> \fIBUS:DEV\fR
Use the controller at BUS:DEV, do not do any automatic
scanning. Useful for cases when a controller isn't known
by xboxdrv, but supports one of the given protocols.
.TP 
\*(T<\fB\-\-device\-by\-id\fR\*(T> \fIVENDOR:PRODUCT\fR
Use device that matches VENDOR:PRODUCT (as returned
by \fBlsusb\fR). Useful for cases when a
controller isn't known by xboxdrv, but supports one of
the given protocols.
.TP 
\*(T<\fB\-\-type\fR\*(T> \fITYPE\fR
Ignore autodetection and enforce the controller type.
Possible values
for \fITYPE\fR:
.RS 
.TP 0.2i
\(bu
xbox
.TP 0.2i
\(bu
xbox-mat
.TP 0.2i
\(bu
xbox360
.TP 0.2i
\(bu
xbox360-wireless
.TP 0.2i
\(bu
xbox360-guitar
.TP 0.2i
\(bu
firestorm
.TP 0.2i
\(bu
firestorm-vsb
.TP 0.2i
\(bu
saitek-p2500
.TP 0.2i
\(bu
generic-usb
.RE

The \*(T<\fBgeneric\-usb\fR\*(T> type is a special type
that will work with any USB controller, it will however
not interpret the input it gets, but just dump it to the
console for development purposes.
See \*(T<\fB\-\-generic\-usb\-spec\fR\*(T> for further
information.
.TP 
\*(T<\fB\-d\fR\*(T>, \*(T<\fB\-\-detach\-kernel\-driver\fR\*(T>
Detaches the kernel driver that is currently associated
with the given device. This is useful when you have the
xpad module loaded and want to use xboxdrv without
unloading it.
.TP 
\*(T<\fB\-\-generic\-usb\-spec\fR\*(T> \fINAME=VALUE,...\fR
Allows to specify from which
endpoint \*(T<\fBgeneric\-usb\fR\*(T> will read. The
spec as the form
of \fINAME=VALUE,...\fR. Allowed values are:
.RS 
.TP 
vid=HEX
The vendor id of the controller to which this spec applies
.TP 
pid=HEX
The product id of the controller to which this spec applies
.TP 
if=NUM
The interface from which GenericUSBController should be read
.TP 
ep=NUM
The endpoint from which GenericUSBController should be read
.RE
.SS "EVDEV OPTION"
.TP 
\*(T<\fB\-\-evdev\fR\*(T> \fIDEVICE\fR
Allows you to read input data from a regular event
device. This allows you to
use \fBxboxdrv\fR on regular PC
joysticks. The data that is read from the event device
is converted internally into a XboxMsg object and then
passed through the same configuration pipeline as it
would be for a regular Xbox360 controller. This allows
you to make use of all the regular configurability, but
limits you to the number of axis and buttons that an
Xbox360 controller provides.

As a regular PC joystick will most likely already create
a \*(T<\fI/dev/input/jsX\fR\*(T> device by itself,
you might need to get rid of that so that a game will
properly detect the joystick device created
by \fBxboxdrv\fR. The easiest way to
accomplish that is to simply delete the old joystick and
rename the device that \fBxboxdrv\fR
created to \*(T<\fI/dev/input/js0\fR\*(T>. When you
use udev, this operation should be harmless and
automatically reverse itself when you remove the
controller and plug it back in or when you reboot the
computer.
.TP 
\*(T<\fB\-\-evdev\-debug\fR\*(T>
The evdev event handler will print all received events
to stdout, this makes it easy to see which events a
given controller sends.
.TP 
\*(T<\fB\-\-evdev\-no\-grab\fR\*(T>
By default the evdev driver will grab the device, thus
making it impossible for other applications to receive
events from that device. This is done to avoid confusing
applications, as otherwise an app would receive every
event twice, once from the original device and once from
the virtual xboxdrv one. In some cases this behaviour is
undesired, such when mapping only an otherwise
unhandled subset of keys of an device, i.e. mapping the
multimedia keys on a keyboard, so this option turns the
grab off.
.TP 
\*(T<\fB\-\-evdev\-absmap\fR\*(T> \fIABSMAP,...\fR
.nf
\*(T<ABSMAP = EVDEV_ABS [ "+", "\-" ] "=" XBOXAXIS ;\*(T>
.fi

Sets how evdev events are mapped to Xbox axis
events. An example configuration would look like this:

.nf
\*(T<\-\-evdev\-absmap ABS_X=x1,ABS_Y=y1,ABS_RZ=x2,ABS_THROTTLE=y2,ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y\*(T>
.fi

\fBxboxdrv\fR will output on startup a full
list of event names that the given event device
supports and that can be used in place of \fIEVDEV_ABS\fR.

It is also possible to map half-axis with a command like:

.nf
\*(T<\-\-evdev\-absmap ABS_Y+=LT,ABS_Y\-=RT\*(T>
.fi

This will map the upward movement of the Y axis to the
left trigger and the downward movement to the right
trigger. 
.TP 
\*(T<\fB\-\-evdev\-keymap\fR\*(T> \fIKEYMAP\fR
Sets how evdev events are mapped to Xbox controller
events. An example configuration would look like this:

.nf
\*(T<\-\-evdev\-keymap BTN_TRIGGER=a,BTN_THUMB=b,BTN_THUMB2=x\*(T>
.fi

\fBxboxdrv\fR will output on start a full
list of event names that the given event device
supports.
.SS "STATUS OPTIONS"
.TP 
\*(T<\fB\-l\fR\*(T>, \*(T<\fB\-\-led\fR\*(T> \fINUM\fR
Set LED status. Possible values for \fINUM\fR are:

\fBLED Status Codes\fR
.TS
r l.
T{
Num
T}	T{
Behavior
T}
.T&
r l.
T{
0
T}	T{
off
T}
T{
1
T}	T{
all blinking
T}
T{
2
T}	T{
1/top-left blink, then on
T}
T{
3
T}	T{
2/top-right blink, then on
T}
T{
4
T}	T{
3/bottom-left blink, then on
T}
T{
5
T}	T{
4/bottom-right blink, then on
T}
T{
6
T}	T{
1/top-left on
T}
T{
7
T}	T{
2/top-right on
T}
T{
8
T}	T{
3/bottom-left on
T}
T{
9
T}	T{
4/bottom-right on
T}
T{
10
T}	T{
rotate
T}
T{
11
T}	T{
blink
T}
T{
12
T}	T{
blink slower
T}
T{
13
T}	T{
rotate with two lights
T}
T{
14
T}	T{
blink
T}
T{
15
T}	T{
blink once
T}
.TE
.TP 
\*(T<\fB\-\-rumble\-gain\fR\*(T> \fIAMOUNT\fR
You can change the rumble strength via:

.nf
\*(T<$ xboxdrv \-\-rumble\-gain 50%\*(T>
.fi

Values larger then 100% are possible as well and will
amplify small rumble commands, rumble commands already
at the maximum will stay unchanged.
.TP 
\*(T<\fB\-q\fR\*(T>, \*(T<\fB\-\-quit\fR\*(T>
Exit xboxdrv after setting LED or rumble values.
.SS "CHATPAD OPTIONS (EXPERIMENTAL)"
Chatpad support is still experimental. Basic keyboard usage
will work, there is however currently no support for
customization or the green and orange key modifiers.
.PP
Starting xboxdrv multiple times in a row with
the \*(T<\fB\-\-chatpad\fR\*(T> option can crash the
controller. Unplugging it and plugging it back in should reset
it.
.TP 
\*(T<\fB\-\-chatpad\fR\*(T>
Enables the support for the Xbox360 Chatpad. WARNING:
This is preliminary code, it will crash your gamepad
when xboxdrv is started multiple times and won't provide
proper keymapping for any of the umlauts and special
characters.
.TP 
\*(T<\fB\-\-chatpad\-no\-init\fR\*(T>
This will start chatpad support with out sending the
init sequence, thus potentially avoiding crashing the
controller if xboxdrv is started multiple times.
.TP 
\*(T<\fB\-\-chatpad\-debug\fR\*(T>
Output raw chatpad data to the stdout for debugging purpose.
.SS "HEADSET OPTIONS (EXPERIMENTAL, XBOX360 USB ONLY)"
Xboxdrv does not support the headset, the options below are
for developers only and will dump raw headset data, not .wav
files.
.TP 
\*(T<\fB\-\-headset\fR\*(T>
Enable headset support and dump incoming data to stdout.
.TP 
\*(T<\fB\-\-headset\-dump\fR\*(T> \fIFILE\fR
Enable headset support and dump incoming data to FILE.
.TP 
\*(T<\fB\-\-headset\-play\fR\*(T> \fIFILE\fR
Enable headset support and send FILE to the headset for playback.
.SS "FORCE FEEDBACK"
.TP 
\*(T<\fB\-\-force\-feedback\fR\*(T>
Enables the standard kernel force feedback interface. It
is disabled by default as it causes trouble with some
applications running in Wine.

Since the Xbox360 controller supports just rumble not full force
feedback, xboxdrv tries to emulate other effects. This emulation
hasn't been tested much and might not always work as expected. Bug
reports and test cases are welcome.

Note that you must close the application that is using force feedback
always before you close the xboxdrv driver, else you might end up with
a hanging non-interruptable xboxdrv process that will require a reboot
to get rid of.

When using xboxdrv in daemon mode with multiple
controller slots you have to enable force feedback for
each slot separately.
.TP 
\*(T<\fB\-\-ff\-device\fR\*(T> \fIDEVICEID\fR
Select to which virtual device the force-feedback
callbacks will be connected to, it defaults to
joystick. Other allowed values are
mouse,
keyboard and any integer number.
See \*(T<\fB\-\-ui\-buttonmap\fR\*(T> for further
information on how device-ids work.
.TP 
\*(T<\fB\-R\fR\*(T>, \*(T<\fB\-\-test\-rumble\fR\*(T>
Pressing LT will move the left rumble motor and pressing
RT will move the right one. Rumble motor strength
depends on how hard you press. This is useful for
testing the rumble motors.
.TP 
\*(T<\fB\-r\fR\*(T>, \*(T<\fB\-\-rumble\fR\*(T> \fIL,R\fR
Set the speed for both rumble motors. Values from 0 to 255 are accepted, the default is 0,0.
.SS "CONTROLLER SLOT OPTIONS"
Controller slots are used when running xboxdrv in daemon mode.
Each slot represents a complete controller configuration. If
you want to use multiple controller in daemon mode you have to
supply multiple controller slots.
.TP 
\*(T<\fB\-\-controller\-slot\fR\*(T> \fIN\fR
Switches to the controller slot with the number N, numbering starts at zero.
.TP 
\*(T<\fB\-\-next\-controller\fR\*(T>
Switches to the next controller slot.
.TP 
\*(T<\fB\-\-match\fR\*(T> \fIRULE,...\fR
Limits a controller slot to devices that match any one
of the given rules. Possible match rules are:
.RS 
.TP 
usbid=\fIVENDOR\fR:\fIPRODUCT\fR
Match controllers that have the
given USB vendor and product ids.
.TP 
vendor=\fIVENDOR\fR
Match controllers that have the
given USB idVendor.
.TP 
product=\fIPRODUCT\fR
Match controllers that have the
given USB idProduct.
.TP 
property=\fIPROPERTY\fR:\fIVALUE\fR
Match against an arbitrary udev property, with
name \fIPROPERTY\fR and
value \fIVALUE\fR.
.TP 
usbpath=\fIBUS\fR:\fIDEV\fR
Match against the USB path given
by \fIBUS\fR
and \fIDEV\fR.
.TP 
usbserial=\fISERIAL\fR
Match against the USB iSerial number.
.RE
.TP 
\*(T<\fB\-\-match\-group\fR\*(T> \fIRULE,...\fR
Limits a controller slot to devices that match all of
the given rules. Possible match rules are the same as
for \*(T<\fB\-\-match\fR\*(T>.
.SS "CONFIG SLOT OPTIONS"
You can use multiple configurations, called config slots, with
your controller. You switch between those multiple
configurations by pressing the Guide button by default, but
you can also set another button via the option \*(T<\fB\-\-toggle\fR\*(T>.
.TP 
\*(T<\fB\-\-config\-slot\fR\*(T> \fINUM\fR
Select the config slot \fINUM\fR.
.TP 
\*(T<\fB\-\-next\-config\fR\*(T>
Allows the creation of an alternative uinput
configuration to which one can toggle at runtime by
pressing the ui-toggle button (defaults to guide).

.nf
\*(T<$ xboxdrv \e
    \-\-mouse \e
  \-\-next\-config 
    \-\-ui\-axismap X1=ABS_X,Y1=ABS_Y \e
    \-\-ui\-buttonmap A=JS_0,B=JS_1\*(T>
.fi

The above configuration would install mouse emulation as
first configuration and a simple joystick emulation as
second configuration. Allowing toggling between mouse
emulation and joystick handling by pressing the guide
button.

Not that \*(T<\fB\-\-next\-config\fR\*(T> is currently limited
to only configurations done
with \*(T<\fB\-\-ui\-buttonmap\fR\*(T>
and \*(T<\fB\-\-ui\-axismap\fR\*(T>, autofire, throttle
emulation, deadzones and all other things can currently
not be switched at runtime.
.TP 
\*(T<\fB\-\-toggle\fR\*(T> \fIXBOXBTN\fR
Sets the button that will be used to toggle between
different different configurations. A value of 'void'
will disable the toggle button. If no toggle button is
specified, the guide button will be used to toggle
between configurations.
.SS "CONFIGURATION OPTIONS"
.TP 
\*(T<\fB\-\-modifier \fR\*(T>\fIMOD\fR
Add a modifier to the modifier stack, see
[Modifier] for
a full list of possible modifier.
.TP 
\*(T<\fB\-\-timeout \fR\*(T>\fIMSEC\fR
Specify the number of miliseconds that xboxdrv will wait
for events from the controller before moving on and
processing things like auto-fire or relative-axis.
Default value is 10, smaller values will give you a
higher resolution auto fire and relative event movement, but will waste some more
CPU.
.TP 
\*(T<\fB\-b, \-\-buttonmap BUTTON=BUTTON,...\fR\*(T>
Button remapping is available via the \*(T<\fB\-\-buttonmap\fR\*(T> option. If you want
to swap button A and B start with:

.nf
\*(T<$ xboxdrv \-\-buttonmap A=B,B=A\*(T>
.fi

If you want all face buttons send out A button events:

.nf
\*(T<$ xboxdrv \-\-buttonmap B=A,X=A,Y=A\*(T>
.fi

Possible button names are (aliases are in parenthesis):

\fBButton Names\fR
.TS
allbox ;
l l.
T{
Name
T}	T{
Description
T}
.T&
l l.
T{
start, back
T}	T{
start, back buttons
T}
T{
guide
T}	T{
big X-button in the middle (Xbox360 only)
T}
T{
a(1), b(2), x(3), y(4)
T}	T{
face buttons
T}
T{
black, white
T}	T{
black, white buttons (Xbox1 only, mapped to lb, rb on Xbox360)
T}
T{
lb(5), rb(6)
T}	T{
shoulder buttons (Xbox360 only, mapped to black, white on Xbox1)
T}
T{
lt(7), rt(8)
T}	T{
analog trigger (needs --trigger-as-button option)
T}
T{
tl, tr
T}	T{
pressing the left or right analog stick
T}
T{
du(up), dd(down), dl(left), dr(right)
T}	T{
dpad directions (needs --dpad-as-button option)
T}
T{
green, red, yellow, blue, orange
T}	T{
guitar buttons
T}
.TE

Just like with \*(T<\fB\-\-ui\-buttonmap\fR\*(T> you can add button filter to each button.
.TP 
\*(T<\fB\-\-axismap\fR\*(T> \fIAXIS=MAPPING,...\fR
Axis remapping is available via --axismap and works the same as button
mapping. In addition you can supply a sign to indicate that an axis
should be inverted. So if you want to invert the y1 axis start with:

.nf
\*(T<$ xboxdrv \-\-axismap \-Y1=Y1\*(T>
.fi

If you want to swap the left and right stick start with:

.nf
\*(T<$ xboxdrv \-\-axismap X2=X1,Y2=Y1,X1=X2,Y1=Y2\*(T>
.fi

Possible axis names are: x1, y1, x2, y2, lt, rt

Swaping lt or rt with x1, y1, x2, y2 will not work properly, since
their range is different.

Just like with \*(T<\fB\-\-ui\-axismap\fR\*(T> you can add axis filter to each axis.
.SS "MODIFIER PRESET CONFIGURATION OPTIONS"
The options in this sections are sortcuts
for \*(T<\fB\-\-modifier\fR\*(T> options.
Unlike \*(T<\fB\-\-modifier\fR\*(T> they are not order
depended, but have a predefined order that is used no matter
the order in which the options are given.
.TP 
\*(T<\fB\-\-autofire BUTTON=FREQUENCY,...\fR\*(T>
Autofire mapping allows you to let a button automatically fire with a
given frequency in miliseconds:

.nf
\*(T<$ xboxdrv \-\-autofire A=250\*(T>
.fi

Combining \*(T<\fB\-\-autofire\fR\*(T> with button map allows you to have one button act
as autofire while another one, emitting the same signal, acts normally.

.nf
\*(T<$ xboxdrv \-\-autofire B=250 \-\-buttonmap B=A\*(T>
.fi
.TP 
\*(T<\fB\-\-axis\-sensitivty \fR\*(T>\fIAXIS=SENSITIVITY\fR,...
The sensitive of an axis can be adjusted via --axis-sensitivty:

.nf
\*(T<$ xboxdrv \-\-axis\-sensitivty X1=\-1.0,Y1=\-1.0\*(T>
.fi

A value of 0 gives you the default linear sensitivity,
values larger then 0 will give you higher sensitivity,
while values smaller then 0 will give you lower
sensitivity. Sensitivity values in the range of [-1, 1]
will generally give good results, everything beyond that
won't be of much practical use.

Sensitivity works by applying:

.nf
\*(T<t = 2 ** sensitivity;
pos = (1.0f \- (1.0f \- pos) ** t) ** (1 / t);\*(T>
.fi

To the value of the axis, this means that both the
minimum value and the maximum value of the axis will
always stay the same, just the response inbetween
changes.

For a complete freeform way to change the axis response
see the \*(T<\fBResponse Curve Filter\fR\*(T>.
.TP 
\*(T<\fB\-\-calibration \fR\*(T>\fICALIBRATIONSPEC\fR
If your gamepad for some reason can't reach the maximum value or isn't
centered properly you can fix that via the calibration options:

.nf
\*(T<$ xboxdrv \-\-calibration X2=\-32768:0:32767\*(T>
.fi

X2 is the axis name and the three values that follow are min, center
and max. Simply insert the values that jstest reports when your axis
is in the respective positions.

You can also use the calibration option if you want to make your
joystick more sensitive. A setting of:

.nf
\*(T<xboxdrv \-\-calibration AXIS=MIN:CENTER:MAX,...\*(T>
.fi

Will cause the joystick device report maximum position when your
stick is only moved half the way.
.TP 
\*(T<\fB\-\-deadzone \fR\*(T>\fINUM\fR
The deadzone is the area at which the sticks do not report any
events. The default is zero, which gives the best sensitifity but
might also cause trouble in some games in that the character or camera
might move without moving the stick. To fix this one has to set the
value to something higher:

.nf
\*(T<$ xboxdrv \-\-deadzone 4000\*(T>
.fi

A value of 4000 works quite well for most games.

You can also give the deadzone in percentage:

.nf
\*(T<$ xboxdrv \-\-deadzone 15%\*(T>
.fi
.TP 
\*(T<\fB\-\-deadzone\-trigger \fR\*(T>\fINUM\fR
The left and right trigger have a separate deadzone value which can be
specified with:

.nf
\*(T<$ xboxdrv \-\-deadzone\-trigger 15%  \*(T>
.fi
.TP 
\*(T<\fB\-\-dpad\-rotation\fR\*(T> \fIDEGREE\fR
Allows you to rotate the
dpad. \fIDEGREE\fR
must be a multiple of 45. This can be useful in
isometric games where the playfield itself is rotated,
thus a:

.nf
\*(T<xboxdrv \-\-dpad\-rotation 45\*(T>
.fi

Will give you controls that are relative to your
character instead of your viewpoint.
.TP 
\*(T<\fB\-\-four\-way\-restrictor\fR\*(T>
The \*(T<\fB\-\-four\-way\-restrictor\fR\*(T> option allows to
limit the movement on both analogsticks to only four
directions (up, down, left, right), the diagonals (up/left,
up/right, down/left, down/right) are filtered out from the
output. This option is useful for games such as Tetris, that
don't need diagonals and where you don't want to accidently
trigger the down-move while trying to do a left/right move.
.TP 
\*(T<\fB\-\-relative\-axis AXIS=NUM,...\fR\*(T>
The function \*(T<\fB\-\-relative\-axis\fR\*(T> allows you
to change the behaviour of an axis so that your movement
of it moves its value up or down instead of applying it
directly. This allows you to simulate throttle control
for flightsim games.

Since the axis might be upside down, you might want to use
the \*(T<\fB\-\-axismap\fR\*(T> function to reverse it.

.nf
\*(T<$ xboxdrv \-\-relative\-axis y2=64000 \-\-axismap \-y2=y2\*(T>
.fi
.TP 
\*(T<\fB\-\-square\-axis\fR\*(T>
The Xbox360 gamepad, as most other current day gamepads,
features a circular movement range, which restricts the
movement so that the distance to the center never gets
beyond 1. This means that when you have the controller
at the top/left the value reported is (0.7, 0.7)
(i.e. length 1, angle 45) instead of (1,1). This
behaviour is different then most classic PC joysticks,
which had a square range and would report (1,1) when
hold in the top/left corner.

Some old games (i.e. mostly DOS stuff) require a
square movement range and will not function properly
with the Xbox360 gamepad. Via the
\*(T<\fB\-\-square\-axis\fR\*(T> option you can work around this issue and diagonals will
be reported as (1,1).
.SS "UINPUT PRESET CONFIGURATION OPTIONS"
The following options are simple shortcuts for common
configurations that can be accomplished manually 
by using \*(T<\fB\-\-ui\-buttonmap\fR\*(T>
and \*(T<\fB\-\-ui\-axismap\fR\*(T>.
.TP 
\*(T<\fB\-\-trigger\-as\-button\fR\*(T>
LT and RT send button instead of axis events
.TP 
\*(T<\fB\-\-trigger\-as\-zaxis\fR\*(T>
Combine LT and RT to form a zaxis instead
.TP 
\*(T<\fB\-\-dpad\-as\-button\fR\*(T>
The DPad sends button instead of axis events.
.TP 
\*(T<\fB\-\-dpad\-only\fR\*(T>
Both sticks are ignored, only the DPad sends out axis
events. Useful for games that might get confused by
additional analog axis. Combining this option
with \*(T<\fB\-\-trigger\-as\-button\fR\*(T> is recommend
in most situations.
.TP 
\*(T<\fB\-\-guitar\fR\*(T>
Sets a predefined button and axis mapping for use with
guitar controllers. This mainly gets rid of a few
unnecessary buttons and axis not used by a guitar
controller.
.TP 
\*(T<\fB\-m, \-\-mouse\fR\*(T>
Lets the controller act as a mouse. It is indendical to:

.nf
\*(T<$ xboxdrv \e
  \-\-dpad\-as\-button
  \-\-deadzone 4000
  \-\-trigger\-as\-zaxis
  \-\-axismap "\-y2=y2,\-trigger=trigger"
  \-\-ui\-axismap "x1=REL_X:15:20,y1=REL_Y:15:20,y2=REL_WHEEL:5:100,x2=REL_HWHEEL:5:100,trigger=REL_WHEEL:5:100"
  \-\-ui\-buttonmap "a=BTN_LEFT,b=BTN_RIGHT,x=BTN_MIDDLE,y=KEY_ENTER,rb=KEY_PAGEDOWN,lb=KEY_PAGEUP,"
  \-\-ui\-buttonmap "dl=KEY_LEFT,dr=KEY_RIGHT,du=KEY_UP,dd=KEY_DOWN,"
  \-\-ui\-buttonmap "start=KEY_FORWARD,back=KEY_BACK,guide=KEY_ESC,tl=void,tr=void"\*(T>
.fi

You can customize it by the usual means, just make sure
that \*(T<\fB\-\-mouse\fR\*(T> comes before your
customization options on the command line.

Note that if you have your mouse buttons switched you must
adjust the above to match your mouse configuration or the
button events will come out wrong.
.TP 
\*(T<\fB\-\-mimic\-xpad\fR\*(T>
Causes xboxdrv to use the same axis and button names as
the xpad kernel driver for wired Xbox360 controller
.TP 
\*(T<\fB\-\-mimic\-xpad\-wireless\fR\*(T>
Causes xboxdrv to use the same axis and button names as
the xpad kernel driver for wired Xbox360 controller
.SS "UINPUT CONFIGURATION OPTIONS"
.TP 
\*(T<\fB\-\-no\-uinput\fR\*(T>
Do not to start UInput, instead simply read events from the controller, useful for debugging.
.TP 
\*(T<\fB\-\-no\-extra\-devices\fR\*(T>
By default xboxdrv will allocate multiple uinput devices
and sort events to each of them. Thus mouse related
events like BTN_LEFT or REL_X will go to a virtual mouse
device, while ABS_X events would go to a virtual
joystick device and KEY_ESC would go to a virtual
keyboard device.

This option disables that automatism and all events will
go to the same virtual device.

Manual assignment to a specific device (i.e.
KEY_ESC@keyboard, BTN_A@joystick, ...) is still possible.
.TP 
\*(T<\fB\-\-no\-extra\-events\fR\*(T>
By default xboxdrv will allocate multiple uinput devices
and sort events to each of them. Thus mouse related
events like BTN_LEFT or REL_X will go to a virtual mouse
device, while ABS_X events would go to a virtual
joystick device and KEY_ESC would go to a virtual
keyboard device.

To make sure sure that a mouse, keyboard or joystick
device is properly detected by Xorg, the kernel or
libraries such SDL xboxdrv will insert extra dummy
events. For example a mouse device needs REL_X and REL_Y
events to be detected as such, but a configuration that
only wants to emulate the mouse buttons won't provide
those, thus xboxdrv will add them automatically.
The \*(T<\fB\-\-no\-extra\-events\fR\*(T> option will
switch this behaviour off.
.TP 
\*(T<\fB\-\-device\-name NAME\fR\*(T>
Changes the descriptive name the device will have. This
options acts the same as
--device-names \fICURRENTSLOT\fR.auto=\fINAME\fR
.TP 
\*(T<\fB\-\-device\-names TYPE.SLOT=NAME,...\fR\*(T>
Changes the descriptive name the device will
have. \fITYPE\fR is one of mouse,
keyboard, joystick, auto
or a number. \fISLOT\fR is a slot
number or auto.
The auto name acts as wild card and
matches everything.
.TP 
\*(T<\fB\-\-device\-usbid VENDOR:PRODUCT:VERSION:BUS\fR\*(T>
Changes the vendor, product, version and bus id that the
device will have. The last two arguments are optional.
This options acts the same as
--device-usbids \fICURRENTSLOT\fR.auto=\fIVENDOR:PRODUCT:VERSION:BUS\fR
.TP 
\*(T<\fB\-\-device\-usbids TYPE.SLOT=VENDOR:PRODUCT:VERSION:BUS,...\fR\*(T>
Changes the vendor, product, version and bus id the device will
have. \fITYPE\fR is one of mouse,
keyboard, joystick, auto
or a number. \fISLOT\fR is a slot
number or auto.
The auto name acts as wild card and
matches everything.
.TP 
\*(T<\fB\-\-ui\-clear\fR\*(T>
Removes all uinput mappings and will leave the driver in
a blank state and only map those things you added
yourself. If you only want to get rid of individual
buttons you can use the 'void' event.
.TP 
\*(T<\fB\-\-ui\-buttonmap\fR\*(T> \fIUIBUTTONSPEC,...\fR
.nf
\*(T<UIBUTTONSPEC = XBOXBUTTON [ "+" XBOXBUTTON ] [ "^" FILTER ] ... "=" ( RELSPEC | BTNSPEC | EXECSPEC ) ;
RELSPEC      = [ DEVICEID "\-" ] "REL_" [ ":" [ VALUE ] [ ":" REPEAT ] ] ;
BTNSPEC      = [ DEVICEID "\-" ] ( ( "BTN_" NAME ) | ( "KEY_" NAME ) ) { "+" BTNSPEC } ;
EXECSPEC     = PROGRAM { ":" ARGUMENT } ;
XBOXBUTTON   = "a" | "b" | "x" | "y" | "lb" | "rb" | "lt" | "rt" | 
               "tl" | "tr" | "start" | "select" | "back" | "guide" | "black" | "white" ;
FILTER       = "toggle" | "invert" | "autofire" [ ":" RATE ] [ ":" DELAY ] | log [ ":" STRING ] ;
NAME         = STRING ;
VALUE        = NUMBER ;
REPEAT       = NUMBER ;
DEVICEID     = NUMBER ;\*(T>
.fi

Allows you to change the event code that is send to the
kernel for buttons. The usage is similar to the normal button
mapping, except that the right hand side is an event name from
\*(T<\fI/usr/include/linux/input.h\fR\*(T>. You can
use all \fBKEY_\fR or \fBBTN_\fR 
codes for \*(T<\fB\-\-ui\-buttonmap\fR\*(T>.

If the right hand side is left empty all the supplied
filters will be added to the already existing button
binding instead of a new one.

Aside from the named keys, you can also give the input
code directly as number via the
syntax \fBKEY_#\fINUM\fB\fR.

Instead of the low level \fBKEY_\fR names,
which represent keycodes, you can also use the higher
level X11 keysyms \fBXK_\fR, the keysyms have
the advantage that they map directly to the key you
expect, while a \fBKEY_\fR name gets mangled
by the X11 keymap and will often not report what you
expect in case you use a keymap that is different then
your keyboard (i.e. dvorak on a qwerty keyboard).

A full list of valid X11 keysyms can be optained
with \*(T<\fB\-\-help\-x11keysym\fR\*(T>.

For joystick buttons there is in addition to the \fBBTN_JOYSTICK\fR, \fBBTN_X\fR,
etc. macros the special name \fBJS_$NUM\fR, which sets the given button to
the $NUMS joystick button, i.e.:

.nf
\*(T<$ xboxdrv \-\-ui\-clear \-\-ui\-buttonmap A=JS_0,B=JS_1\*(T>
.fi

Note that this will only work if no other joystick
button ids are in the way.

You can also map a button to a \fBREL_\fR
event. In that case you can supply additional paramaters in the form of:

.nf
\*(T<$ xboxdrv \-\-ui\-buttonmap X=REL_???:VALUE:REPEAT\*(T>
.fi

\fIVALUE\fR gives the value of the event (default: 10)

\fIREPEAT\fR
gives the number of milisecond to pass before the event
is fired again (default: 5)

The special 'void' event allows you to clear any
existing bindings for a given button, which can be
useful in cases when a game only supports a limited
number of buttons.

You can also prepend a device_id to the UIBUTTONSPEC
which allows you to create multiple uinput devices. By
default 'auto' is assumed as device_id which
automatically try to do the right thing, sending
keyboard events to a keyboard device and mouse events to
a mouse device. Other possible values are 'mouse' and
\&'keyboard'. A device_id of '0' refers to the first
joystick device, values larger then 0 to the second,
third, etc. 

Note that the 'mouse' and 'keyboard' device_id names do
not give you a mouse or keyboard device, these are just
symbolic names for the devices into which xboxdrv will
sort events that look like a mouse or keyboard
event. The final determination of which device gets
handled as what will be done by the Kernel or Xorg
depending on what events a device provides. 

An example configuration making use of device_id would look like this:

.nf
\*(T<xboxdrv \-s \e
  \-\-ui\-clear \e
  \-\-ui\-buttonmap A=JS_0@0,B=JS_1@0 \-\-ui\-axismap X2=ABS_X@0,Y2=ABS_Y@0
  \-\-ui\-buttonmap X=JS_0@0,Y=1\-JS_1@0 \-\-ui\-axismap X2=ABS_X@1,Y2=ABS_Y@1\*(T>
.fi

In this example the left stick creates a joystick device
and the right stick creates a separate joystick device.

When using multiple controller slots you can
additionally append the slot id and thus assign events
across controller slot boundaries. The syntax for that
is:

.nf
\*(T<BTN_A@{deviceid}.{slotid}\*(T>
.fi

Instead of giving just a single button, it is also
possible to give two buttons
to \*(T<\fB\-\-ui\-buttonmap\fR\*(T> to allow shifting:

.nf
\*(T<xboxdrv \-s \e
  \-\-ui\-clear \e
  \-\-ui\-buttonmap A=JS_0,B=JS_1,LB+A=JS_2,LB+B=JS_3\*(T>
.fi

In this example LB acts as shift button, if A is pressed
without LB it will send out a JS_0 event, but if LB is
pressed it will send a JS_2 event instead. This allows
you to multiply the number of available buttons on the
controller.

See the section KEYBOARD EMULATION below on how to
resolve issues with Xorg not detecting the virtual
keyboard that xboxdrv creates.

You can also apply filters to button events:

.nf
\*(T<xboxdrv \-s \e
  \-\-ui\-buttonmap A^toggle=JS_0\*(T>
.fi

For documentation on the filters you can apply to events
see [Button Filter].
.TP 
\*(T<\fB\-\-ui\-axismap\fR\*(T> \fIUIAXISSPEC,...\fR
.nf
\*(T<UIAXISSPEC = [ XBOXBTN "+" ] XBOXAXIS { "^" FILTER }  "=" ( RELSPEC | RELREP | KEYSPEC | ABSSPEC ) ;
KEYSPEC    = [ "key:" ] "KEY_" NAME ":" "KEY_" NAME ":" THRESHOLD ;
RELSPEC    = [ "rel:" ] "REL_" NAME ":" VALUE ":" REPEAT ;
RELREP     = "rel\-repeat:" "REL_" NAME ":" VALUE ":" REPEAT ;
ABSSPEC    = [ "abs:" ] "ABS_" NAME ;
FILTER     = ( "calibration" | "cal" ) ":" MIN ":" CENTER ":" MAX |
             ( "sensitifity" | "sen" ) ":" SENSITIFITY |
             ( "deadzone" | "dead" ) ":" MIN ":" MAX ":" SMOOTH |
             ( "relative" | "rel" ) ":" SPEED  |
             ( "responsecurve" | "response" | "resp" ) { ":" VALUE }
XBOXBTN    = "a" | "b" | "x" | "y" | "start" | "back" | "guide" | "lb" | "rb" | ...
XBOXAXIS   = "x1" | "y1" | "x2" | "y2" | "z" | "lt" | "rt" | "dpad_x" | "dpad_y" ;
VALUE      = NUMBER ;
REPEAT     = NUMBER ;
THRESHOLD  = NUMBER ;
NAME       = STRING ;\*(T>
.fi

Similar to \*(T<\fB\-\-ui\-buttonmap\fR\*(T> this option
allows you to change the event code that is send to the
kernel for axes. The events that are available are the
same as for \*(T<\fB\-\-ui\-buttonmap\fR\*(T>.

.nf
\*(T<$ xboxdrv \-\-ui\-axismap X1=REL_???:VALUE:REPEAT\*(T>
.fi

\fIVALUE\fR gives
the maximum value of the event, the actual value that gets send
is \fIVALUE\fR * axis_state.
(default: 10)

\fIREPEAT\fR
gives the number of milisecond to pass before the event
is fired again (default: 5).

The value of -1 has a special meaning, it will result in
the REL event being fired as soon as possible (i.e.
every \fItimeout\fR miliseconds).
This is the recomment way for handling mouse emulation,
as it will keep REL events syncronized and thus avoid
jaggies in the movement, that will result from manually
specifying a timeout.

.nf
\*(T<$ xboxdrv \-\-ui\-axismap X1=KEY_UP:KEY_DOWN:THRESHOLD\*(T>
.fi

\fIKEY_UP\fR gives the keycode to be send when the axis is moved up

\fIKEY_DOWN\fR gives the keycode to be send when the axis is moved down

\fITHRESHOLD\fR gives the threshold that triggers the sending of an event

Just like \*(T<\fB\-\-ui\-buttonmap\fR\*(T>, you can
also use shift keys in place of the XBOXAXIS:

.nf
\*(T<$ xboxdrv \-\-ui\-axismap X1=ABS_X,LB+X1=ABS_RX\*(T>
.fi

This allows you to send ABS_X events normally and ABS_RX
events when the LB button is held down.

For information on how to use axis filters, see [Axis Filter].
.SH "INPUT EVENT HANDLER"
Input event handler decide what comes out of the virtual input
devices that xboxdrv creates. They for example decide that when
button A is pressed on a gamepad, that a virtual keyboard will
emit a press of the space key.
.PP
Furthermore input event handler can also perform some basic
transformation of the input signals, thus a joystick can be used
to send WASD keys.
.SS "BUTTON EVENT HANDLER"
A button event handler decides what happens when a button is
pressed, it needs to be specified with
the \*(T<\fB\-\-ui\-buttonmap\fR\*(T> option. The example below
shows the simplest use case:
.PP
.nf
\*(T<$ xboxdrv \-\-ui\-buttonmap A=key:KEY_A\*(T>
.fi
.PP
Here \*(T<\fBkey\fR\*(T> is the name of the button event
handler, while \*(T<\fBKEY_A\fR\*(T> is an argument for the
event handler. What kind of arguments an event handler allows
depends on the event handler.
.PP
There is also a shorthand form of specifing event handlers by
just writing:
.PP
.nf
\*(T<$ xboxdrv \-\-ui\-buttonmap A=KEY_A\*(T>
.fi
.PP
Here no handler is specified explicitly, if that is the case,
the appropriate handler will be guessed based on the event
type. \*(T<EV_KEY\*(T> events will be handled by
the \*(T<\fBkey\fR\*(T> handler, \*(T<EV_REL\*(T> by
the \*(T<\fBrel\fR\*(T> handler and \*(T<EV_ABS\*(T> by
the \*(T<\fBabs\fR\*(T> handler. 
.TP 
\*(T<\fBkey\fR\*(T>:\fIKEY_EVENT\fR, \*(T<\fBkey\fR\*(T>:\fIKEY_EVENT\fR:\fIKEY_EVENT\fR:\fIHOLD_THRESHOLD_MSEC\fR
The \*(T<\fBkey\fR\*(T> handler is the most basic one,
it maps a button directly to a virtual key or another
button.

If additional arguments are supplied the button will be
able to send out two different events. The first event
specified will be send when the button is clicked
normally, while the second event will be send in case
the button is hold down for the time specified
in \fIHOLD_THRESHOLD_MSEC\fR.

An example for the hold button would look like:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap A=JS_0:JS_1:500\*(T>
.fi

This will send JS_0 events when the button is pressed
and switch to JS_1 events when the button was hold for
500 miliseconds.

The hold button feature is useful to effectly double the
number of available buttons, thus the dpad can for
example be used to send out eight different button
events instead of just four, which is enough to handle
weapons in most FPS games.
.TP 
\*(T<\fBabs\fR\*(T>
not yet implemented
.TP 
\*(T<\fBrel\fR\*(T>:\fIREL_EVENT\fR:\fIVALUE\fR:\fIREPEAT\fR
The rel handler will send out a REL event whenever the
button is pressed. \fIVALUE\fR
gives the value of the event that will be send,
while \fIREPEAT\fR gives the number
of miliseconds till the event will be send again.

A typical use for REL events is emulation of the scroll
wheel of a mouse, an example configuration would be:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap Y=rel:REL_WHEEL:1:500,A=rel:REL_WHEEL:\-1:500\*(T>
.fi

Here Y will scroll up and A will scroll down.
.TP 
\*(T<\fBcycle\-key\fR\*(T>:\fIKEY_EVENT\fR:...
The cycle-key handler will switch
the \fIKEY_EVENT\fR that gets send
with each button press. This is useful in situations
where a range of buttons should be mapped to a single
key. For example a FPS might have weapons mapped from 1
to 6, but only a single key on the gamepad is free, thus
one could write:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap A=cycle\-key:KEY_1:KEY_2:KEY_3:KEY_4:KEY_5:KEY_6\*(T>
.fi
.TP 
\*(T<\fBcycle\-key\-named:\fR\*(T>\fINAME\fR\*(T<\fB:\fR\*(T>\fIKEY_EVENT\fR\*(T<\fB:...\fR\*(T>
The \*(T<\fBcycle\-key\-named\fR\*(T> handler works
exactly like the \*(T<\fBcycle\-key\fR\*(T> handler,
except that a name has to be supplied for the cycle
sequence. The name of the sequence is used
by \*(T<\fBcycle\-key\-ref\fR\*(T> to access the
sequence and reuse it for another button.

In this simple example A is used to toggle through all
weapon keys forward, while B is used to toggle the keys backwards:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap A=cycle\-key\-named:weapons:KEY_1:KEY_2:KEY_3:KEY_4,B=cycle\-key\-ref:weapons\*(T>
.fi
.TP 
\*(T<\fBcycle\-key\-ref\fR\*(T>:\fINAME\fR:\fIDIRECTION\fR, \*(T<\fBsequence\-key\-ref\fR\*(T>:\fINAME\fR:\fIDIRECTION\fR
The \*(T<\fBcycle\-key\-ref\fR\*(T> handler will access
and reuse the named cycle keysequence given
by \fINAME\fR.
If \fIDIRECTION\fR can either be
\&'forward' or 'backward', if no direction is supplied it
will default to 'backward'.

See \*(T<\fBcycle\-key\-named\fR\*(T> for a full example.
.TP 
\*(T<\fBsequence\-key\-named:\fR\*(T>\fINAME\fR\*(T<\fB:\fR\*(T>\fIKEY_EVENT\fR\*(T<\fB:...\fR\*(T>
The \*(T<\fBsequence\-key\-named\fR\*(T> works exactly
the same as the \*(T<\fBcycle\-key\-named\fR\*(T>, with
the only difference being that
the \*(T<\fBsequence\-key\-named\fR\*(T> will not wrap
around when reaching the beginning or end of the
sequence.

This behaviour is useful in flight simulations or other
games where thrusters might be controllered by numeric
keys and it wouldn't make much sense to jump from zero
to full thrust in one go.

To move backwards through the sequence another key must
be bound to \*(T<\fBsequence\-key\-ref\fR\*(T>.
.TP 
\*(T<\fBexec\fR\*(T>
The exec button handler allows to launch an application
when the button was pressed. An example would look like
this:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap A=exec:/home/juser/local/bin/screenshot.sh\*(T>
.fi

Possible uses for the button are the ability to do
screenshots or perform other tasks that are outside the
main application you are using xboxdrv with.
.TP 
\*(T<\fBmacro\fR\*(T>
A button can be bound to a macro via:

.nf
\*(T<xboxdrv \e
  \-\-ui\-buttonmap A=macro:/home/juser/.xboxdrv/somefile.macro\*(T>
.fi

The \*(T<\fI.macro\fR\*(T> file has the form of:

.nf
\*(T<
send KEY_LEFTSHIFT 1
wait 500
send KEY_LEFTSHIFT 0\*(T>
.fi

All abs, rel and key events can be send from a macro file.
.SS "AXIS EVENT HANDLER"
Axis event handler decide what happens when an axis is moved.
Like button event handler they come in different forms and
like button event handler they provide a shortcut
form. \*(T<EV_KEY\*(T> events will be handled by
the \*(T<\fBkey\fR\*(T> handler, \*(T<EV_REL\*(T> by
the \*(T<\fBrel\fR\*(T> handler and \*(T<EV_ABS\*(T>
by the \*(T<\fBabs\fR\*(T> handler.
.TP 
\*(T<\fBabs\fR\*(T>:\fIABS_EVENT\fR
The \*(T<\fBabs\fR\*(T> handler is the simplest of them
all, it will simply send out the value it gets as input
as the given \fIABS_EVENT\fR event
to the kernel. Thus a basic configuration to make the
left stick behave as joystick would look like this:

.nf
\*(T<xboxdrv \e
  \-\-ui\-axismap X1=abs:ABS_X,Y1=abs:ABS_Y\*(T>
.fi
.TP 
\*(T<\fBkey\fR\*(T>:\fIKEY_UP\fR:\fIKEY_DOWN\fR:\fITHRESHOLD\fR
\fIKEY_UP\fR gives the keycode to be send when the axis is moved up

\fIKEY_DOWN\fR gives the keycode to be send when the axis is moved down

\fITHRESHOLD\fR gives the threshold that triggers the sending of an event

Just like \*(T<\fB\-\-ui\-buttonmap\fR\*(T>, you can
also use shift keys in place of the XBOXAXIS:

.nf
\*(T<$ xboxdrv \-\-ui\-axismap X1=ABS_X,LB+X1=ABS_RX\*(T>
.fi

This allows you to send ABS_X events normally and ABS_RX
events when the LB button is held down.
.TP 
\*(T<\fBrel\fR\*(T>:\fIREL_EVENT\fR:\fIVALUE\fR:\fIREPEAT\fR
\fIVALUE\fR gives
the maximum value of the event, the actual value that gets send
is \fIVALUE\fR * axis_state.
(default: 10)

\fIREPEAT\fR
gives the number of milisecond to pass before the event
is fired again (default: 5).

The value of -1 has a special meaning, it will result in
the REL event being fired as soon as possible (i.e.
every \fItimeout\fR miliseconds).
This is the recomment way for handling mouse emulation,
as it will keep REL events syncronized and thus avoid
jaggies in the movement, that will result from manually
specifying a timeout.

The \*(T<\fBrel\fR\*(T> handler is mainly useful for
mouse pointer emulation, if you want to emulate a mouse
scroll wheel use the \*(T<\fBrel\-repeat\fR\*(T> handler
instead.
.TP 
\*(T<\fBrel\-repeat\fR\*(T>:\fIREL_EVENT\fR:\fIVALUE\fR:\fIREPEAT\fR
The \*(T<\fBrel\-repeat\fR\*(T> handler is similar to
the \*(T<\fBrel\fR\*(T> handler, but optimized for
emulating the scroll wheel of a mouse.

\fIVALUE\fR isn't scaled to how far
the axis has moved, instead it is constant, instead the
time given in \fIREPEAT\fR is
scaled according to the axis movement. Thus the further
the stick is moved, the more events will be send.

The need for both \*(T<\fBrel\-repeat\fR\*(T>
and \*(T<\fBrel\fR\*(T> arises from the fact that Xorg
converts scroll wheel movement to button presses before
they are handed to an application, thus an application
never properly sees the changes
in \fIVALUE\fR, by
scaling \fIREPEAT\fR instead that
problem is worked around.
.SH "INPUT FILTER"
Input filter allow to manipulate the events that come from the
controller. They can be used
on \*(T<\fB\-\-buttonmap\fR\*(T>, \*(T<\fB\-\-axismap\fR\*(T>, \*(T<\fB\-\-ui\-buttonmap\fR\*(T>
and \*(T<\fB\-\-ui\-axismap\fR\*(T>. The difference between the
two is that the \*(T<\fB\-\-ui\-...\fR\*(T> versions applies to
the uinput events, while the other version applies to Xbox360
controller events.
.SS "BUTTON FILTER"
.TP 
\*(T<\fBtog\fR\*(T>, \*(T<\fBtoggle\fR\*(T>
The toggle filter will turn the button into a toggle
button, clicking the button will set it to pressed state
and pressing it again will unpress it. Useful for games
where you might want to permanently run or duck without
holding the button pressed.
.TP 
\*(T<\fBinv\fR\*(T>, \*(T<\fBinvert\fR\*(T>
The invert filter will keep the button in pressed state
when it is not pressed and in unpressed state when it is
pressed.
.TP 
\*(T<\fBauto\fR\*(T>, \*(T<\fBautofire\fR\*(T>:\fIRATE\fR:\fIDELAY\fR
The autofire filter allows to repeatatly send button
press events when the button is held down. It takes two
optional parameters:

\fIRATE\fR is the number of
miliseconds between button press events.

\fIDELAY\fR the amount of
miliseconds till the autofire will start, before that
delay the button will act as normal.
.TP 
\*(T<\fBclick\-press\fR\*(T>
The \*(T<\fBclick\-press\fR\*(T> filter will transmit a single button
click when the button is pressed.
.TP 
\*(T<\fBclick\-release\fR\*(T>
The \*(T<\fBclick\-release\fR\*(T> filter will transmit a single button
click when the button is released.
.TP 
\*(T<\fBclick\-both\fR\*(T>
The \*(T<\fBclick\-both\fR\*(T> filter will transmit a
single button click when the button is pressed and
another one when it is released.
.TP 
\*(T<\fBconst\fR\*(T>:\fIVALUE\fR
The const filter will ignore the input signal and send a
constant value to the output. This can be used for
example in combination with multiple configurations to
signal a game or another application which configuration
is currently active.
.TP 
\*(T<\fBdelay\fR\*(T>:\fITIME\fR
A button has to be held down for TIME miliseconds before
it will emit an event, press events shorter then that will
be ignored.
.TP 
\*(T<\fBlog\fR\*(T>:\fISTRING\fR
The log filter will output everything to stdout that
goes through it to, this is useful for debugging the
filter. A \fISTRING\fR can be
provided as parameter that will be outputed before the
event.
.SS "AXIS FILTER"
.TP 
\*(T<\fBcal\fR\*(T>, \*(T<\fBcalibration\fR\*(T>:\fIMIN\fR:\fICENTER\fR:\fIMAX\fR
See \*(T<\fB\-\-calibration\fR\*(T>.
.TP 
\*(T<\fBsen\fR\*(T>, \*(T<\fBsensitivity\fR\*(T>:\fISENSITIVITY\fR
See \*(T<\fB\-\-axis\-sensitivity\fR\*(T>.
.TP 
\*(T<\fBdead\fR\*(T>, \*(T<\fBdeadzone\fR\*(T>:\fIVALUE\fR, \*(T<\fBdeadzone\fR\*(T>:\fIMIN\fR:\fICENTER\fR:\fIMAX\fR 
Deadzone filter applies a deadzone to the current axis.
If only \fIMIN\fR is provided, the
parameter will be interpreted
as \fI-MIN:MIN:1\fR. If the
argument is 1, smooth filtering will be applied so that
the end of the deadzone is 0. Setting the argument to 0
will apply a simple cut-off filter, where all events
smaller then the threshold are ignored.
.TP 
\*(T<\fBrel\fR\*(T>, \*(T<\fBrelative\fR\*(T>:\fISPEED\fR
See \*(T<\fB\-\-relative\-axis\fR\*(T>.
.TP 
\*(T<\fBresp\fR\*(T>, \*(T<\fBresponse\fR\*(T>:\fIVALUES\fR:...
The response curve filter allows you to completely
change the way an axis reacts. The filter takes a list
of \fIVALUES\fR that are then
linearly interpolated and spread across the full range
of the axis. An example would look like this:

.nf
\*(T<xboxdrv \e
 \-\-ui\-axismap x1^resp:\-32768:\-4000:0:4000:32767\*(T>
.fi

Here the X1 axis is manipulated so that it will have a
lower sensitivity in the center and a higher one on the
outside.
.TP 
\*(T<\fBconst\fR\*(T>:\fIVALUE\fR
The const filter will ignore the input signal and send a
constant value to the output. This can be used for
example in combination with multiple configurations to
signal a game or another application which configuration
is currently active.
.TP 
\*(T<\fBlog\fR\*(T>:\fISTRING\fR
The log filter will output everything to stdout that
goes through it to, this is useful for debugging the
filter. A \fISTRING\fR can be
provided as parameter that will be outputed before the
event.
.SS MODIFIER
While button and axis filter only apply to a single axis or
button at a time, modifiers apply to the complete controller
at once and can thus be used to perform modifications that
require input from multiple axis or buttons. Most of the
modifiers explained below replicate functionality provided by
regular options, but allow more fine tuning, such as limiting
the effects to a single analog stick instead of just applyig
it to all. Note that modifiers are applied one after the
other, so order is important.
.TP 
\*(T<\fBdpad\-rotate\fR\*(T>=\fIDEGREE\fR
See \*(T<\fB\-\-dpad\-rotation\fR\*(T>.
.TP 
\*(T<\fBdpad\-restrictor\fR\*(T>=\fIRESTRICTON\fR
Restricts the dpad movement, values
for \fIRESTRICTON\fR can be:

x-axis: only allow movement in the X axis

y-axis: only allow movement in the Y axis

fourway: allow movement in X and Y axis, but filter out diagonals
.TP 
\*(T<\fB4wayrest\fR\*(T>, \*(T<\fBfour\-way\-restrictor\fR\*(T>=\fIXAXIS\fR:\fIYAXIS\fR
See \*(T<\fB\-\-four\-way\-restrictor\fR\*(T>.
.TP 
\*(T<\fBsquare\fR\*(T>, \*(T<\fBsquare\-axis\fR\*(T>=\fIXAXIS\fR:\fIYAXIS\fR
See \*(T<\fB\-\-square\-axis\fR\*(T>.
.TP 
\*(T<\fBrotate\fR\*(T>=\fIXAXIS\fR:\fIYAXIS\fR:\fIDEGREE\fR:\fIMIRROR\fR
Rotates the stick given by \fIXAXIS\fR and \fIYAXIS\fR by \fIDEGREE\fR and optionally \fIMIRRORS\fR it.
.TP 
\*(T<\fBstat\fR\*(T>, \*(T<\fBstatistic\fR\*(T>
The statistic modifier doesn't actually modify anything,
instead it collects statistics on the controller, such
as how many times a button has been pressed. The results
of the collections will be displayed on shutdown of
xboxdrv.

Note that the stat modifier is part of the modifier
stack, thus to get correct results you must make sure
that it comes first in the stack when it should work on
real events and not be confused by auto-fire or similar
modifications.
.SH "RUNNING XBOXDRV"
.SS "USING A SINGLE CONTROLLER"
Plug in your Xbox360 gamepad and then unload the xpad driver via:
.PP
.nf
\*(T<$ rmmod xpad\*(T>
.fi
.PP
If you want to permanently unload it add the following line to
\*(T<\fI/etc/modprobe.d/blacklist.conf\fR\*(T>:
.PP
.nf
\*(T<blacklist xpad\*(T>
.fi
.PP
Next you have to load the uinput kernel module which allows
userspace programms to create virtual input devices and the
joydev module handles the \*(T<\fI/dev/input/jsX\fR\*(T>
devices:
.PP
.nf
\*(T<$ modprobe uinput
$ modprobe joydev\*(T>
.fi
.PP
You also have to make sure that you have access rights to
/dev/input/uinput, either add yourself to the appropriate group,
adjust the permissions or run xboxdrv as root.
.PP
Once ensured that xpad is out of the way and everything is in place
start the userspace driver with:
.PP
.nf
\*(T<$ xboxdrv\*(T>
.fi
.PP
Or in case you don't have the neccesary rights (being in group root
should often be enough) start the driver as root via:
.PP
.nf
\*(T<$ sudo xboxdrv\*(T>
.fi
.PP
This will create /dev/input/js0 and allow you to access the
gamepad from any game. To exit the driver press Ctrl-c.
.PP
By default xboxdrv will echo all controller events to the
console, this makes it easy to see if things are properly
working, but will eat a lot of CPU, thus it is strongly
recomment to disabled that output with
the \*(T<\fB\-\-silent\fR\*(T> option.
.PP
The trigger buttons are handled by xboxdrv normally as axis,
giving you analog feedback, while this reproduces the Xbox360
controller the most accurately, it will confuse many and only
be useful in a few, racing games mainly. So in the majority of
cases it is recomment to change the triggers to regular buttons via:
.PP
.nf
\*(T<$ xboxdrv \-\-trigger\-as\-button\*(T>
.fi
.SS "USING MULTIPLE CONTROLLER"
If you want to use multiple wired controllers you need to start
multiple instances of the xboxdrv driver and append the -i
argument to select the appropriate controller like this:
.PP
.nf
\*(T<$ xboxdrv \-i 1\*(T>
.fi
.PP
If you have multiple wireless controller you need to start
multiple instances of the xboxdrv driver and append
the \*(T<\fB\-\-wid\fR\*(T> option like this:
.PP
.nf
\*(T<$ xboxdrv \-\-wid 1\*(T>
.fi
.PP
You have to sync the wireless controller as usual.
.PP
To see a list of all the controllers that xboxdrv detects
being connected to your system use:
.PP
.nf
\*(T<$ xboxdrv \-\-list\-controller\*(T>
.fi
.SS "HOTPLUGGING AND XBOXDRV DAEMON"
To allow hotplugging of gamepads xboxdrv has to be run in
daemon mode. This is accomplished with
the \*(T<\fB\-\-daemon\fR\*(T> option:
.PP
.nf
\*(T<$ xboxdrv \-\-daemon\*(T>
.fi
.PP
When launched in daemon mode xboxdrv will listen to udev
events and thus be notified whenever a new USB device gets
plugged into the computer. It will then match that device
against its list of supported devices and launch a separate
thread to handle that gamepad.
.PP
Note that xboxdrv will not allow an arbitrary large number of
controllers to be used in that mode, it can only handle as
many controllers as you have allocated controller slots at
startup. New slots can be allocated
with \*(T<\fB\-\-next\-controller\fR\*(T> and by default one
slot is always allocated, thus to support three controller you
would run it with:
.PP
.nf
\*(T<$ xboxdrv \-\-daemon \-\-next\-controller \-\-next\-controller\*(T>
.fi
.PP
Each controller slot can be configured individually and you
can limit which gamepad gets assigned to which slot with
the \*(T<\fB\-\-match\fR\*(T> option.
.PP
Note that xboxdrv will create the virtual uinput devices on
startup, not when a gamepad gets plugged in, this allows to
plug in gamepads even after a game or an application like XBMC
has already been launched and still have it all function
properly. 
.PP
In daemon mode xboxdrv can be detached from the current shell
via \*(T<\fB\-\-detach\fR\*(T>, to get a handle on it to kill
it you can write its pid via the \*(T<\fB\-\-pid\-file\fR\*(T>:
.PP
.nf
\*(T<$ sudo xboxdrv \-\-daemon \-\-detach \-\-pid\-file /var/run/xboxdrv.pid\*(T>
.fi
.SH "XBOXDRV DAEMON DBUS INTERFACE"
When Xboxdrv is run as daemon it will export some API functions
via D-Bus, thus allowing to make configuration changes at
runtime. The D-Bus interface can be accessed either by the
numerous language bindings provided or via the generic command line tool
\fBdbus-send\fR or by the more
userfriendly \fBxboxdrvctl\fR tool. Examples below are
given for the raw \fBdbus-send\fR.
.PP
Introspection is provided via the usual means:
.PP
.nf
\*(T<dbus\-send \-\-session \-\-type=method_call \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv /org/seul/Xboxdrv org.freedesktop.DBus.Introspectable.Introspect

dbus\-send \-\-session \-\-type=method_call \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv /org/seul/Xboxdrv/ControllerSlots/0 org.freedesktop.DBus.Introspectable.Introspect

dbus\-send \-\-session \-\-type=method_call \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv /org/seul/Xboxdrv/Daemon org.freedesktop.DBus.Introspectable.Introspect\*(T>
.fi
.PP
Status information on available slots, configuration and active controllers can be obtained via:
.PP
.nf
\*(T<dbus\-send \e
  \-\-session \-\-type=method_call \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv /org/seul/Xboxdrv/Daemon  org.seul.Xboxdrv.Daemon.Status\*(T>
.fi
.PP
Setting the LED on controller 0 can be done via:
.PP
.nf
\*(T<dbus\-send \-\-session \-\-type=method_call  \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv  /org/seul/Xboxdrv/ControllerSlots/0  org.seul.Xboxdrv.Controller.SetLed int32:4\*(T>
.fi
.PP
Setting the rumble motors on controller 0 can be done via:
.PP
.nf
\*(T<dbus\-send \-\-session \-\-type=method_call  \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv  /org/seul/Xboxdrv/ControllerSlots/0  org.seul.Xboxdrv.Controller.SetRumble int32:255 int32:255\*(T>
.fi
.PP
Setting a specific controller slot configuration, just
as \*(T<\fB\-\-toggle BTN\fR\*(T> allows, can be done with:
.PP
.nf
\*(T<dbus\-send \-\-session \-\-type=method_call  \-\-print\-reply \e
  \-\-dest=org.seul.Xboxdrv  /org/seul/Xboxdrv/ControllerSlots/0  org.seul.Xboxdrv.Controller.SetConfig int32:2\*(T>
.fi
.SH TESTING
Knowing how to test a xboxdrv configuration is absolutely crucial in
understanding what is wrong in a given setup. Testing the
configuration in a game is most often not helpful, since you won't see
the true cause beyond endless layers of abstraction between you and
the actual events. Luckily there are a few tools you can use to test,
all of these are command line based and it is recomment that you get
familar with them when you want to do any more complex configuration.
.SS EVTEST
evtest lets you read raw input events from \*(T<\fI/dev/input/eventX\fR\*(T>. The
event devices are the very core of all event handling, things like the
joystick devices are derived from the event device, so if you want to
fix some issue on the joystick device, you have to fix the event
device.
.PP
evtest is available in the tools/ directory or as part of your
distribution in the package \*(T<\fIevtest\fR\*(T>. your
distribution.
.SS JSTEST
jstest lets you read the output out of a joystick event device (/dev/input/js0).
.PP
jstest is available in the tools/ directory or as part of your
distribution \*(T<\fIjoystick\fR\*(T>.
.SS SDL-JSTEST
sdl-jstest lets you see events as games using SDL see them. This is
very important when you want to set and test the SDL_LINUX_JOYSTICK
environment variables.
.PP
It is currently available via:
.PP
.nf
\*(T<$ svn co svn://svn.berlios.de/windstille/trunk/sdl\-jstest\*(T>
.fi
.PP
Or from the same Ubuntu PPA that also contains xboxdrv in the package \*(T<\fIsdl\-jstest\fR\*(T>.
.SS XEV
xev lets you see the events that Xorg sees. Note however that you
might not see all events, since some will be grapped by your Window
manager before they reach xev, this is normal.
.PP
xev is part of every Linux distribution, on Ubuntu its available via:
.PP
.nf
\*(T<$ apt\-get install x11\-utils\*(T>
.fi
.SS "JSCALC AND JSCALIBRATOR"
Both of these tools lets you calibrate your gamepad, however
with pretty much all current gamepads this is no longer
needed and actually harmful as it might overwrite a perfectly
good working configuration with a broken one (unplugging the
gamepad or a reboot will fix that). So avoid them unless you
clearly understand the issues of using them.
.PP
If your gamepad produces incorrect data and you do want to
calibrate it you might want to check out the
option \*(T<\fB\-\-calibration\fR\*(T>, which lets you tweak
the way xboxdrv interprets your gamepad data.
.SS MOUSE
No tools for testing the output on /dev/input/mouseX are known.
.SS NOTE
If the tools provide no output at all, this might not be due to a
wrong configuration, but due to Xorg grabbing your event device and
locking it, see Xorg section for possible fixes.
.SH EXAMPLES
The configurations below are just a few random examples, further
examples can be found in the \*(T<\fIexamples/\fR\*(T>
directory of the xboxdrv source tree or
in \*(T<\fI/usr/share/doc/xboxdrv/examples/\fR\*(T>.
.SS "TURNING TRIGGERS INTO BUTTONS"
By default xboxdrv will handle the trigger as analog axis, not
buttons, while this is beneficial for racing games, it will
confuse many other games, thus xboxdrv provides an easy way to
change the handling into buttons via
the \*(T<\fB\-\-trigger\-as\-button\fR\*(T> option:
.PP
.nf
\*(T<$ xboxdrv \-\-trigger\-as\-button\*(T>
.fi
.SS "CONFIGURE A DEADZONE"
Many gamepads don't center exactly at zero, but at random
values around it. This 'noise' can confuse some games and is
thus be best filtered out, this can be accomplished with:
.PP
.nf
\*(T<$ xboxdrv \-\-deadzone 25%\*(T>
.fi
.PP
The percentance is the amount of noise that will get filtered
out, you can also give raw device values if you leave out the
% sign. If you want to have a deadzone only on a specific axis
you have to use axis filter:
.PP
.nf
\*(T<$ xboxdrv \-\-buttonmap X1^deadzone:15000\*(T>
.fi
.SS "KEYBOARD EMULATION"
The following configuration will cause xboxdrv to emulate a
keyboard, which can be useful for games that are played with
keyboard, like Flash games or games that don't support a
joystick. Since different games use different keyboard keys
you might have to adjust the keybindings to fit the game:
.PP
.nf
\*(T<$ xboxdrv \e
  \-\-ui\-clear \e
  \-\-ui\-buttonmap a=XK_a,b=XK_b,x=XK_x,y=XK_y \e
  \-\-ui\-buttonmap dl=XK_Left,dr=XK_Right,du=XK_Up,dd=XK_Down\*(T>
.fi
.SS "FIGHTING GAMES:"
In this configuration the left and right trigger get turned
into digital buttons. All axis except the dpad are ignored. RB
and RT are mapped to act as if buttons 1,2 and 3 are pressed
simultaniously which is useful for some special attacks.
Instead of using the native button names, the 1,2,3,...
aliases are used, which makes things a little easier to read:
.PP
.nf
\*(T<$ xboxdrv \e
  \-\-dpad\-only \e
  \-\-trigger\-as\-button \e
  \-\-buttonmap lb=1,x=2,y=3,lt=4,a=5,b=6 \e
  \-\-buttonmap rb=1,rb=2,rb=3 \e
  \-\-buttonmap rt=4,rt=5,rt=6\*(T>
.fi
.SS "CH FLIGHTSTICK EMULATION IN DOSBOX:"
In \*(T<\fIdosbox.conf\fR\*(T> set:
.PP
.nf
\*(T<[joystick]
joysticktype = ch\*(T>
.fi
.PP
Start xboxdrv with:
.PP
.nf
\*(T<$ xboxdrv \-s \e
  \-\-trigger\-as\-zaxis \-\-square\-axis \e
  \-\-relative\-axis y2=64000 \-\-axismap \-y2=x2,x2=y2\*(T>
.fi
.PP
Your right analog stick will act as trottle control, the
trigger as rudder. Using \*(T<\fB\-\-modifier\fR\*(T> to
install a four-way restrictor might also be worth a
consideration to not accidently touch the throttle when the
rudder is moved.
.SS "USING MOUSE EMULATION AND JOYSTICK AT THE SAME TIME"
To use mouse emulation and joystick at the same time you have
to register two configuration with xboxdrv, this works via:
.PP
.nf
\*(T<$ xboxdrv \-\-next\-config \-\-mouse\*(T>
.fi
.PP
The \*(T<\fB\-\-next\-config\fR\*(T> option will open up a second
configuration and all configuration options on the right side
of it will go there, while everything on the left side of it
will go into the first configuration. Toggling between the
configurations works with the guide button, you can have as
many configuratios as you want.
.SS "MAPPING EVERY BUTTON MULTIPLE"
Some games might require more buttons then your gamepad has,
in those situation it can be useful to map a button twice by
using shifted buttons:
.PP
.nf
\*(T<$ xboxdrv \e
  \-\-ui\-clear \e
  \-\-ui\-axismap X1=ABS_X,Y1=ABS_Y \e
  \-\-ui\-buttonmap a=JS_0,b=JS_1,x=JS_2,y=JS_3 \e
  \-\-ui\-buttonmap lb+a=JS_4,lb+b=JS_5,lb+x=JS_6,lb+y=JS_7 \e
  \-\-ui\-buttonmap rb+a=JS_8,rb+b=JS_9,rb+x=JS_10,rb+y=JS_11
\*(T>.fi
.PP
Here all face buttons are get mapped three times, once when
pressed normally, once when pressed while LB is held down and
once when RB is held down, thus given you for the six buttons
12 virtual ones.
.SS SAUERBRATEN
First analogstick gets mapped te cursor keys, second
analogstick gets mapped to mouse. Note: This is just an
incomplete example, not a perfectly playable configuration,
you have to do tweaking yourself.
.PP
.nf
\*(T<$ xboxdrv \e
  \-\-ui\-axismap x2=REL_X:10,y2=REL_Y:\-10,x1=KEY_LEFT:KEY_RIGHT,y1=KEY_UP:KEY_DOWN \e
  \-\-ui\-buttonmap a=BTN_RIGHT,b=BTN_LEFT,x=BTN_EXTRA \e
  \-\-ui\-buttonmap rb=KEY_5,lb=KEY_6,lt=BTN_LEFT,rt=BTN_RIGHT \e
  \-\-ui\-buttonmap y=KEY_ENTER,dl=KEY_4,dr=KEY_2,du=KEY_1,dd=KEY_3,back=KEY_TAB,start=KEY_ESC \e
  \-s \-\-deadzone 6000  \-\-dpad\-as\-button \-\-trigger\-as\-button\*(T>
.fi
.SS WARSOW
Note: This is just an incomplete example, not a perfectly playable
configuration, you have to do tweaking yourself.
.PP
.nf
\*(T<$ xboxdrv \e
  \-\-ui\-axismap x2=REL_X:10,y2=REL_Y:\-10,x1=KEY_A:KEY_D,y1=KEY_W:KEY_S \e
  \-\-ui\-buttonmap a=KEY_LEFTSHIFT,b=BTN_C,x=BTN_EXTRA,y=KEY_C \e
  \-\-ui\-buttonmap lb=BTN_RIGHT,rb=KEY_SPACE \e
  \-\-ui\-buttonmap lt=KEY_Z,rt=BTN_LEFT \e
  \-\-ui\-buttonmap dl=KEY_4,dr=KEY_2,du=REL_WHEEL:\-1:150,dd=REL_WHEEL:1:150 \e
  \-\-ui\-buttonmap back=KEY_TAB,start=KEY_ESC \e
  \-s \-\-deadzone 6000 \-\-dpad\-as\-button \-\-trigger\-as\-button\*(T>
.fi
.SH "WRITING START-UP SCRIPTS FOR GAMES"
When you want full game specific configurability and automatic
launching of xboxdrv, it is easiest to write little startup
scripts for your games that will launch xboxdrv, launch your
game and then when the game is finished tear down xboxdrv:
.PP
.nf
\*(T<#!/bin/sh

exec xboxdrv \e
  \-\-trigger\-as\-button \-s \e
  \-\- \e
  your_favorite_game

# EOF #\*(T>
.fi
.PP
Here \*(T<\fIyour_favorite_game\fR\*(T> is the executable
of your game and is passed to xboxdrv as last argument. This
will cause xboxdrv to start the game and keep running as long as
the game is running, when the game is done, xboxdrv will quit
automatically.
.PP
If you want to pass parameters to the game you have to add
a \*(T<\fB\-\-\fR\*(T> separator, as otherwise your options to
the game would be eaten up by xboxdrv.
.SH "SDL NOTES"
To let SDL know which axis act as a hat and which act as normal axis
you have to set an environment variable:
.PP
.nf
\*(T<
$ SDL_LINUX_JOYSTICK="'Xbox Gamepad (userspace driver)' 6 1 0"
$ export SDL_LINUX_JOYSTICK\*(T>
.fi
.PP
You might also need in addition use this (depends on the way SDL was compiled):
.PP
.nf
\*(T<
$ SDL_JOYSTICK_DEVICE="/dev/input/js0"
$ export SDL_JOYSTICK_DEVICE\*(T>
.fi
.PP
This will let the DPad act as Hat in SDL based application. For
many games the driver will work without this, but especially in
Dosbox this variable is very important.
.PP
If you use options in xboxdrv that change the number of axis you
have to adjust the variable accordingly, see:
.TP 0.2i
\(bu
\(laftp://ptah.lnf.kth.se/pub/misc/sdl-env-vars\(ra
.TP 
SDL_LINUX_JOYSTICK
Special joystick configuration string for linux. The format is
\*(T<\fB"name numaxes numhats numballs"\fR\*(T>
where name is the name string of the joystick (possibly in single
quotes), and the rest are the number of axes, hats and balls
respectively.
.TP 
SDL_JOYSTICK_DEVICE
Joystick device to use in the linux joystick driver, in addition to the usual: \*(T<\fI/dev/js*\fR\*(T>, \*(T<\fI/dev/input/event*\fR\*(T>, \*(T<\fI/dev/input/js*\fR\*(T>
.SH TROUBLESHOOTING
.SS "\(dqNO XBOX OR XBOX360 CONTROLLER FOUND\(dq"
This means that either your controller isn't plugged in or is
not recognized by the driver. To fix this you need to know the
idVendor and the idProduct numbers, which you can find out
via:
.PP
.nf
\*(T<$ lsusb \-v\*(T>
.fi
.PP
Once done you can try to add them to this array in \*(T<\fIsrc/xpad_device.cpp\fR\*(T>:
.PP
.nf
\*(T<XPadDevice xpad_devices[] = { ... }\*(T>
.fi
.PP
If you have success with that, send a patch
to <\*(T<grumbel@gmail.com\*(T>>, if not, contact me too, I
might be able to provide additional help.
.PP
As an alternative you can also use the --device and --type option to
enforce a USB device as well as a controller type an bypass any auto
detection.
.SS "\(dqUNKNOWN DATA: BYTES: 3 DATA: ...\(dq"
This means that your controller is sending data that isn't understood
by the driver. If your controller still works, you can just ignore it,
the Xbox360 controller seems to send out useless data every now and
then. If your controller does not work and you get plenty of those
lines when you move the sticks or press buttons it means that your
controller talks an un-understood protocol and some reverse
enginiering is required. Contact <\*(T<grumbel@gmail.com\*(T>> and include the output
of:
.PP
.nf
\*(T<$ lsusb \-v\*(T>
.fi
.PP
Along with all the "Unknown data" lines you get. 
.SS "\(dqERROR: NO STUITABLE UINPUT DEVICE FOUND\(dq"
Make sure that uinput and joydev kernel modules are loaded. Make sure
that you have a /dev/input/uinput, /dev/uinput or /dev/misc/uinput and
permissions to access it.
.PP
Before reporting this as a bug make sure you have tested if the driver
itself works with:
.PP
.nf
\*(T<$ xboxdrv \-\-no\-uinput \-v\*(T>
.fi
.SS "THE WIRELESS CONTROLLER DOESN'T WORK"
You have to sync the controller befor it can be used, restart of the
driver isn't needed and the driver should let you now when it recieves
a connection after you sync the controller.
.SS "KEYBOARD EMULATION"
When you try to let xboxdrv send a keyboard events
via \*(T<\fB\-\-ui\-buttonmap\fR\*(T>
or \*(T<\fB\-\-ui\-axismap\fR\*(T> Xorg must register the device
as keyboard device to work properly. This seems to work
automatically when you bind more then two keyboard keys, if you
bind less you need to create the
file \*(T<\fI/etc/hal/fdi/preprobe/xboxdrv.fdi\fR\*(T>
containing:
.PP
.nf
\*(T<
<?xml version="1.0" encoding="UTF\-8"?>
<deviceinfo version="0.2">
  <device>
    <match key="input.product" string="Xbox Gamepad (userspace driver) \- Keyboard Emulation">
      <addset key="info.capabilities" type="strlist">input.keys</addset>
    </match>
  </device>
</deviceinfo>\*(T>
.fi
.PP
This will tell HAL and later Xorg that xboxdrv acts as keyboard.
.SS "WACOM ISSUES"
In some older kernels a Wacom graphic tablet creates a
joystick device, so xboxdrv or any other real joysticks ends
up as \*(T<\fI/dev/input/js1\fR\*(T> instead
of \*(T<\fI/dev/input/js0\fR\*(T>. In many games this
causes the joystick to not function any more.
.PP
A temporary workaround for this is to simply delete the joystick
device js0 and replace it with a symbolic link js1 via:
.PP
.nf
\*(T<$ sudo ln \-sf /dev/input/js1 /dev/input/js0\*(T>
.fi
.PP
This workaround will only last till the next reboot, since the device
names are dynamically created, but for the time being there doesn't
seem to any other way to easily work around this issue. 
.PP
In newer kernels this issue is fixed.
.SS "UINPUT ISSUES"
On Ubuntu 9.04 the permissions of the uinput device have
changed to 0640, meaning only root has access to the device.
To change this back so that users in the group root have
access the device and in turn can run xboxdrv without sudo you
have to create a file
called \*(T<\fI/etc/udev/rules.d/55\-permissions\-uinput.rules\fR\*(T>
with the content:
.PP
.nf
\*(T<KERNEL=="uinput", MODE="0660", GROUP="root"\*(T>
.fi
.SS "WINE ISSUES"
When using the Xbox360 gamepad in Wine it is not specially
handled as Xbox360 gamepad, but as generic DirectInput gamepad.
This means games will not display the proper button labels, but
just numbers (i.e. 'Btn1' instead of 'A' for example). Aside
from that it should work fine.
.PP
XInput support (the Microsoft DirectInput replacment, not the
Xorg xinput) is as of January 2011 not implemented in Wine, so
games that require XInput and don't have an DirectInput fallback
will not work with a Xbox360 controller, unofficial patches
however do exist.
.SH "XORG ISSUES"
If you start xboxdrv and instead of having a fully working
joystick, you end up controlling the mouse that might be due to
recent changes in Xorg and its device hotplug handling. There
are four workarounds, the one that involves
editing \*(T<\fI/etc/hal/fdi/policy/preferences.fdi\fR\*(T>
is the recommont one.
.SS "TEMPORARY WORKAROUND USING HAL-DEVICE"
Get the device id from hal:
.PP
.nf
\*(T<$ hal\-find\-by\-property \-\-key 'info.product' \-\-string 'Xbox Gamepad (userspace driver)'\*(T>
.fi
.PP
Then remove the device from hal with:
.PP
.nf
\*(T<$ hal\-device \-r $DEVICEID\*(T>
.fi
.SS "TEMPORARY WORKAROUND USING XINPUT"
Second workaround works with xinput:
.PP
.nf
\*(T<$ xinput list
$ xinput set\-int\-prop $DEVICEID 'Device Enabled' 32 0\*(T>
.fi
.SS "PERMANENT WORKAROUND USING .FDI FILES"
The former two workarounds are just temporary and have to be redone
after each start of xboxdrv, the last workaround is a permanent one:
.PP
You have to edit:
.PP
\*(T<\fI/etc/hal/fdi/policy/preferences.fdi\fR\*(T>
.PP
And insert the following lines:
.PP
.nf
\*(T<
<match key="input.product" string="Xbox Gamepad (userspace driver)">
  <remove key="input.x11_driver" />
</match>\*(T>
.fi
.SS "PERMANENT WORKAROUND BY DISABLING DEVICE AUTO DETECTION"
A fourth workaround involved disabling the autodetection of Xorg
completly, you can do that by adding the following lines to
\*(T<\fI/etc/X11/xorg.conf\fR\*(T>:
.PP
.nf
\*(T<Section "ServerFlags"
  Option "AutoAddDevices" "False"
EndSection\*(T>
.fi
.PP
Note that without auto detection you will have to manually configure
all your mice and keyboards or your Xorg Server won't start up
properly. So unless you are already familiar with editing Xorg you
better avoid this workaround. Workaround 3) has basically the same
effect, except that auto detection only gets disabled for the single
device it is causing problems.
.SH "FORCE FEEDBACK PROGRAMMING"
For documentation on the FF interface see:
.TP 0.2i
\(bu
\(lahttp://github.com/github/linux-2.6/blob/f3b8436ad9a8ad36b3c9fa1fe030c7f38e5d3d0b/Documentation/input/ff.txt\(ra
.TP 0.2i
\(bu
\*(T<\fI/usr/include/linux/input.h\fR\*(T>
.PP
Additional, non Linux related, force feedback related
information can be found at:
.TP 0.2i
\(bu
.URL http://www.immersion.com/developer/downloads/ImmFundamentals/HTML/ ""
.TP 0.2i
\(bu
.URL http://msdn.microsoft.com/en-us/library/bb219655(VS.85).aspx ""
.PP
\fBfftest\fR is an application you can use to test the force feedback
interface.
.PP
Force feedback is disabed by default since it causes trouble in
certain application. "Tomb Raider: Legend" for example when run
in Wine crashes at startup when rumble is enabled, while it
works perfectly normal when rumble is disabled.
.SH BUGS
.SS "X11 KEYSYM ISSUES"
X11 keysyms might not work correctly in \*(T<\fB\-\-ui\-buttonmap a=XK_Foobar\fR\*(T>
when Foobar is mapped to multiple keycodes in the keymap. 
.PP
Workaround: Use \fBKEY_\fR instead or cleanup your keymap
.PP
Newer versions of Xorg will also do perform some auto
configuration that might lead to your keymap being switched
whenever a new keyboard is detected, in cases of custom
Xmodmaps this might confuse xboxdrv and make the XK_ style
names unusable. No workaround for that is known right now.
.SS "NON-INTERRUPTABLE PROCESSES DUE TO FORCE FEEDBACK"
Force feedback support is brittle, if you Ctrl-c the driver in the
wrong moment you will end up with a dead uninterruptable process and
basically have to reboot. This looks like it might be a kernel issue
and not a xboxdrv one.
.PP
Workaround: Kill the app that uses xboxdrv before xboxdrv itself.
.SS "QUESTIONS, BUG REPORTS AND FEATURE REQUESTS"
Bug reports and feature request can be report to the xboxdrv issue tracker at:
.PP
.URL https://github.com/Grumbel/xboxdrv/issues/new ""
.PP
General questions and requests for configuration help should
be directed to the xboxdrv mailing list at:
.PP
.URL http://groups.google.com/group/xboxdrv ""
.SH COPYRIGHT
Copyright \(co 2010-2011 Ingo Ruhnke <\*(T<grumbel@gmail.com\*(T>>
License GPLv3+: GNU GPL version 3 or later
.URL http://gnu.org/licenses/gpl.html ""
\&. This is free software: you
are free to change and redistribute it. There is NO WARRANTY,
to the extent permitted by law.
.SH "SEE ALSO"
\fBxboxdrvctl\fR(1), 
\fBevtest\fR(1), 
\fBjstest\fR(1), 
\fBjstest-gtk\fR(1), 
\fBxev\fR(1),
\fBfftest\fR(1),
\fBlsusb\fR(1)
