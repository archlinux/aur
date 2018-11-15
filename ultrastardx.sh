#!/bin/bash
# a simple wrapper to stop/start pulseaudio
# before and after ultrastardx
pacmd exit
systemctl --user mask pulseaudio.socket
/usr/bin/ultrastardx
systemctl --user unmask pulseaudio.socket
systemctl --user start pulseaudio
