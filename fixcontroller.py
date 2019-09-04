#!/usr/bin/env python3

# https://gist.github.com/dnmodder/de2df973323b7c6acf45f40dc66e8db3

import usb.core
import systemd.journal

dev = usb.core.find(idVendor=0x045e, idProduct=0x028e)

if dev is None:
	systemd.journal.send('XBox generic controller not found', SYSLOG_IDENTIFIER='xbox-generic-controller')
	raise ValueError('Device not found')
else:
	dev.ctrl_transfer(0xc1, 0x01, 0x0100, 0x00, 0x14) 
	systemd.journal.send('XBox generic controller found and fixed', SYSLOG_IDENTIFIER='xbox-generic-controller')
