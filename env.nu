#!/bin/nu

def build [] {
	makepkg --printsrcinfo | save -f .SRCINFO
}

def install [] {
	makepkg -si
}
