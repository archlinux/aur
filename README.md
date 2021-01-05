# upaste
x0.at paste client.  

### Usage
# Upload a file
```
$ up [OPTIONS] file  
$ cat file.ext | up [OPTIONS]  
```

# Upload text
```
$ echo "upaste rocks" | up
$ up
upaste
really
rocks
C-d C-d
```
Options :  
    -h    Print this usage  
    -a    Enable autocopy in clipboard  
    -t    Set extension, without dot
