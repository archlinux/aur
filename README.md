A small script that help you generate password and check for the password strength

optional arguments:
  -h, --help   show this help message and exit
  -a           Generate password with 12 char length and all the groups are selected (the same as running passtools -lunpc)
  -s LENGTH    Generate password with specifiend size,length (default: 12)
  -d           Include numbers in the passwrod (default: False)
  -u           Include upper chars in the passwrod (default: False)
  -l           Include lower chars in the passwrod (default: False)
  -p           Include special chars in the passwrod (default: False)
  -r           Allow repeated char (default: False)
  -c           Copy the passwrod to clipboard (default: False)
  -e           print the strength of the password (default: False)
  -x PASSWORD  Password to proccess
