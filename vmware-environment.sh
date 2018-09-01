# Uncomment the line below if you have a problem of incompatible libraries
#export VMWARE_USE_SHIPPED_LIBS=yes

# Avoid an issue with some keyboard layouts using iBus
export GTK_IM_MODULE_FILE=/dev/null

# Workaround to use the GTK theme
if [ -z "$GTK_THEME" ]; then
	theme=$(gtk-query-settings gtk-theme-name | cut -d '"' -f2)
	# Hack to know if the theme is compatible with GTK 3.14 (used by VMware)
	if [ \( -d ~/.themes/"$theme" -a -d ~/.themes/"$theme"/gtk-3.20 \) -o \( -d /usr/share/themes/"$theme" -a -d /usr/share/themes/"$theme"/gtk-3.20 \) ]; then
		export GTK_THEME="$theme"
	fi
fi
