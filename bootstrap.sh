if [ ! -f srnd.ini ]; then
	srndv2 setup
	srndv2 run
else
	srndv2 run
fi
