#!/bin/sh

### Use these for older version firmware
#evdev-joystick --e /dev/input/by-id/usb-CAMMUS006_CAMMUS_CP5_PEDALS_4975237D3448-event-if00 --d 0 --minimum 1995 --maximum 4095 --axis 1
#evdev-joystick --e /dev/input/by-id/usb-CAMMUS006_CAMMUS_CP5_PEDALS_4975237D3448-event-if00 --d 0 --minimum 0 --maximum 2930 --axis 2

### Use these for firmware 9 and above
evdev-joystick --e /dev/input/by-id/usb-CAMMUS006_CAMMUS_CP5_PEDALS_4975237D3448-event-if00 --d 0 --minimum 0 --maximum 4095 --axis 1
evdev-joystick --e /dev/input/by-id/usb-CAMMUS006_CAMMUS_CP5_PEDALS_4975237D3448-event-if00 --d 0 --minimum 0 --maximum 2930 --axis 2
