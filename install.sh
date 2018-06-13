
update_config_txt()
{
	grep -q dtoverlay=hyperpixel /boot/config.txt ||
	cat <<EOF >>/boot/config.txt
dtoverlay=hyperpixel
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=800
framebuffer_height=480
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=87
dpi_output_format=0x6f016
display_rotate=2
hdmi_timings=800 0 50 20 50 480 1 3 2 3 0 0 0 60 0 32000000 6
dtoverlay=hyperpixel-gpio-backlight
EOF
}

post_install()
{
	update_config_txt

	systemctl enable hyperpixel-init
	systemctl enable hyperpixel-touch

	cat <<EOF

You need to reboot to activate the HyperPixel display

EOF
}

post_upgrade()
{
	update_config_txt

	systemctl daemon-reload
}

pre_remove()
{
	systemctl disable hyperpixel-init
	systemctl disable hyperpixel-touch
}

