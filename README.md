# upaste
Paste and upload files on ix.io and x0.at  

### Usage

Bash file uploader  

Usage :

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
    -a    Disable autocopy in clipboard  
