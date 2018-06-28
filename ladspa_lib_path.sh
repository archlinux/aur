if [ -z "$LADSPA_PATH" ]; then
	export LADSPA_PATH=/usr/lib/ladspa
else
	export LADSPA_PATH=$LADSPA_PATH:/usr/lib/ladspa
fi
