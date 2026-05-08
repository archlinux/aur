#!/bin/nu

def build [] {
	makepkg --printsrcinfo | save .SRCINFO
}
