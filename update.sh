#!/bin/sh

updpkgsums
pkgctl build --inspect failure
