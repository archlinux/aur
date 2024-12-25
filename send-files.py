import requests
domain = "127.0.0.1:8080"
myurl = "http://" + domain + "/upload"
files = {"file": open("/home/artem/htmlbuilder-nodejs-bridge/files.zip", "rb")}
data = {"API": "myapi"}
res = requests.post(myurl, data=data, files=files)
print(res.text)
