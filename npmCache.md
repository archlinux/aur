
https://github.com/runk/npm-proxy-cache 

 ```
 docker run -it -p 8880:8080 npm-proxy-cache --ttl $[24*60*60] --host 0.0.0.0 --expired
``` 

```
 npm config set proxy http://localhost:8880/
 npm config set https-proxy http://localhost:8880/
 npm config set strict-ssl false
``` 
