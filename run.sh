case "$1" in
	i686)
	    chmod 755 HammerDB-2.17-Linux-x86-Install && \
	    ./HammerDB-2.17-Linux-x86-Install --mode silent --prefix "$2" 2> /dev/null
	;;
	x86_64)
	    chmod 755 HammerDB-2.17-Linux-x86-64-Install && \
	    ./HammerDB-2.17-Linux-x86-64-Install --mode silent --prefix "$2" 2> /dev/null
	;;
	*)
	    exit 0
esac
exit 0
