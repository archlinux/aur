# Why is the download so complicated and uses a custom downloader?

The download link only works with a hash that also seems to depend on the user agent. The hash can be derived from the `x-usrid` HTTP header, which is only set in the HTTP response when requesting the undocumented URL [https://mengelke.de/Projekte/FritzBox-Tools;fb_tools.md5](https://mengelke.de/Projekte/FritzBox-Tools;fb_tools.md5).

For example, the hash for the user agent `_` can be calculated as follows:

```sh
curl -A "_" -IsS "http://mengelke.de/Projekte/FritzBox-Tools;fb_tools.md5" | grep -ioP "x-usrid: \K\S+" | base64 -d | xxd -ps | sed 's/^0*//'
```

To make matters worse, the returned `x-usrid` HTTP header changes regularly, so a new request must be made for each download to get the current value of this header.

The necessary procedure was derived by reverse engineering.
