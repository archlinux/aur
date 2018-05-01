# Uncomment the line below if you have a problem of incompatible libraries
#export VMWARE_USE_SHIPPED_LIBS=yes

# Avoid an issue with some keyboard layouts using iBus
export GTK_IM_MODULE_FILE=/dev/null

# Workaround to use the GTK theme
if [ -z $GTK_THEME ]; then
	export GTK_THEME=$(gtk-query-settings gtk-theme-name | cut -d '"' -f2)
fi
