#!/usr/bin/env python

# https://gist.github.com/dnmodder/de2df973323b7c6acf45f40dc66e8db3

import usb.core
import systemd.journal

def jprint(*args):
	print(*args)
	systemd.journal.send(*args, SYSLOG_IDENTIFIER='xbox-generic-controller')

dev = usb.core.find(idVendor=0x045e, idProduct=0x028e)

if dev is None:
	jprint('XBox generic controller not found')
else:
	dev.ctrl_transfer(0xc1, 0x01, 0x0100, 0x00, 0x14) 
	jprint('XBox generic controller found and fixed')
