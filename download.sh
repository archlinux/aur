wget --header='authority:omnetpp.org' \
	  --header='method:GET' \
	  --header='path:/omnetpp/send/30-omnet-releases/2305-omnetpp-50-linux' \
	  --header='scheme:https' \
	  --header='accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
	  --header='accept-encoding:gzip, deflate, sdch, br' \
	  --header='accept-language:en-US,en;q=0.8,pt-PT;q=0.6,pt;q=0.4,en-GB;q=0.2' \
	  --header='cookie:__cfduid=d1bb9abc9c4001de43c1a8743bb9ea65e1478628669; imstime=1478628796; fcb7e5dfc3182a73cb86f768253d1ad1=it577vfrhi4a3gl2bj1rgkrms1' \
	  --header='referer:https://omnetpp.org/omnetpp' \
	  --header='upgrade-insecure-requests:1' \
	  --header='user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2922.1 Safari/537.36' \
	  https://omnetpp.org/omnetpp/send/30-omnet-releases/2305-omnetpp-50-linux \
	  -O omnetpp-5.0-src.tgz
