#! /usr/bin/bash
fusermount -u /ipfs
fusermount -u /ipns
ipfs daemon --mount
