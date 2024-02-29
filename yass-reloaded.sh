#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/typora-flags.conf ]]; then
	YASS_RELOADED_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/yass-reloaded-flags.conf | tr '\n' ' ')"
fi

# prefer new java version
export PATH="/usr/lib/jvm/java-21-openjdk/bin/:$PATH"

java --module-path "/usr/lib/jvm/java-21-openjfx/lib" --add-modules "javafx.base,javafx.web,javafx.graphics,javafx.fxml,javafx.media,javafx.swing,javafx.controls" -jar "/usr/share/java/yass-reloaded.jar" "$@" $YASS_RELOADED_USER_FLAGS
