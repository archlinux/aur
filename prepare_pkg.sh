#!/usr/bin/env bash

makepkg --printsrcinfo > .SRCINFO

makepkg --install
