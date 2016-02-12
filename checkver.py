#!/usr/bin/env python3
import http.client,datetime

tempdate = datetime.date.today()
timedelta = datetime.timedelta(days=1)
url = "c591116.r16.cf2.rackcdn.com"
requrl  = "/ekopath/nightly/Linux/"

while(True):
    conn = http.client.HTTPConnection(url)
    filename = "ekopath-" + tempdate.strftime("%Y-%m-%d") + "-installer.run"
    req = conn.request("HEAD", requrl + filename)
    resp = conn.getresponse()
    conn.close()
    if resp.status == 200:
        print("http://" + url + requrl + filename)
        break
    tempdate -= timedelta
