if test -z "$ENSENSO_INSTALL"; then
	if test -n "$XDG_CONFIG_HOME"; then
		export ENSENSO_INSTALL="$XDG_CONFIG_HOME/ensenso"
	else
		export ENSENSO_INSTALL="$HOME/.config/ensenso"
	fi
fi
