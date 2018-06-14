wget	--header='Host: omnetpp.org' \
			--header='User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3452.0 Safari/537.36' \
			--header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
			--header='Accept-Language: en-US,en;q=0.9,pt-PT;q=0.8,pt;q=0.7,en-GB;q=0.6' \
			--header='Accept-Encoding: gzip, deflate, br' \
			--header='Referer: https://omnetpp.org/component/jdownloads/category/31-release-test-versions?Itemid=-1' \
			--header='Cookie: __cfduid=d55cea1ad7a9d8f6bae647956e03063241528992404; fcb7e5dfc3182a73cb86f768253d1ad1=a5f3a1998a82cb02924c280d5bc775a1' \
			--header='Connection: keep-alive' \
			--header='Upgrade-Insecure-Requests: 1' \
			https://www.omnetpp.org/omnetpp/send/30-omnet-releases/2331-omnetpp-5-4-linux \
	  	-O omnetpp-5.4-src-linux.tgz
