# upaste
Paste and upload files on ix.io and x0.at  .
ix.io is used for piped text.  
x0.at is used for stdin upload and file upload because it correctly set filetype.

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
