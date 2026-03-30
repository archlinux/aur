# 2fa-unix
2FA авторизация в unix система со своим сервером


### Build

```
gcc -fPIC -shared -o pam_2fact.so 2fact.c -lcurl -lpam
go build -o aserver server.go 
```

### Install

```
sudo cp aserver /usr/local/bin/
sudo cp aserver.service /etc/systemd/system/
sudo cp pam_2fact.so /lib64/security/

systemctl daemon-reload
systemctl restart aserver.service
systemctl enable aserver
```

#### Register user


```
curl -X POST http://localhost:13031/api/v1/register \
  -H "Content-Type: application/json" \
  -d '{"username":"user","password":"pass"}'
```

### Get token

```
curl -X POST http://localhost:13031/api/v1/token \
  -H "Content-Type: application/json" \
  -d '{"username":"user","password":"pass"}'
```

#### Config PAM.d

```
echo "auth required pam_2fact.so username=<username> token=<token>" >>  /etc/pam.d/system-auth
```


