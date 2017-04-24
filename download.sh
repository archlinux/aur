wget --header='authority:omnetpp.org' \
	  --header='method:GET' \
	  --header='path:/omnetpp/send/30-omnet-releases/2309-omnetpp-5-1-linux' \
	  --header='scheme:https' \
	  --header='accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
	  --header='accept-encoding:gzip, deflate, sdch, br' \
	  --header='accept-language:en-US,en;q=0.8,pt-PT;q=0.6,pt;q=0.4,en-GB;q=0.2' \
	  --header='cookie:__cfduid=d50836abc713caa68412f2569f4306ef41490692140; fcb7e5dfc3182a73cb86f768253d1ad1=eqim9j7u991od77bhhdhou9v30' \
	  --header='referer:https://omnetpp.org/omnetpp' \
	  --header='upgrade-insecure-requests:1' \
	  --header='user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.15 Safari/537.36' \
	  https://omnetpp.org/omnetpp/send/30-omnet-releases/2309-omnetpp-5-1-linux \
	  -O omnetpp-5.1-src-linux.tgz
