#!/bin/sh

ruby=$(which ruby)

[ -z $PAX_FLAGS_SUDO ] && sudo='' || sudo='sudo'

[ "$(paxctl -v $ruby 2>/dev/null)" ] || {
	$sudo paxctl -cm $ruby
}

$sudo systemctl --system daemon-reload

$sudo linux-pax-flags.rb $@
