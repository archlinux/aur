#!/bin/bash
/usr/bin/VPinballX_BGFX -Play "$(zenity --file-selection --file-filter='*.vpx' --title="Select a vpx table to launch")"
