#! /bin/bash

updpkgsums

makepkg --printsrcinfo > .SRCINFO

rm ./LICENSE-MIT ./dufs*
