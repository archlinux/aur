#! /bin/bash

updpkgsums

makepkg --printsrcinfo >.SRCINFO
