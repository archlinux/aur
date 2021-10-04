# pulseaudio-nextsink

Each call to pulseaudio-nextsink iterates through the list of output sinks in pulseaudio via pactl

Meant to be used with a hotkey daemon for easy access

example sxhkd config I use with this:

```
alt + e ; a
	pulseaudio-nextsink
```
