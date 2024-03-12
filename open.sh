#!/bin/bash

if [[ $@ =~ '--show-item' ]]; then
	file=$(echo "$@" | cut -c 13-)
	xdg-open $(dirname "${file}")
else
	xdg-open $@
fi