#!/bin/bash
cookie=$(mktemp)
url=$1

shift
curl -sS -c ${cookie} https://im.qq.com 1>/dev/null
curl $@ $(curl -sS --json "{\"url\":\"${url}\"}" -b ${cookie} https://im.qq.com/http2rpc/gotrpc/noauth/trpc.qqntv2.urlsign.UrlSign/GetSign -H 'x-oidb: {"uint32_command":"0x9b8e","uint32_service_type":1}' | jq .data.url -r)
rm -f ${cookie}
