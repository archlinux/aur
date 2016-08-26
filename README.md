# bhash_crack.sh
Bash Hash Cracker.
--------------

#####  Script created by Pierre Pailleux
##### <pailleux.pierre@gmail.com>

##### **This script is for TESTING PURPOSES ONLY** </br>
##### **The author is not responsible for any illegal use of this script m'kay !** </br>

###### *This program was fully tested on ArchLinux :*
+ *Kernel 4.7.1-1-ARCH*
+ *GNU bash, version 4.3.46(1)-release*


Supported algorithms :
--------------
+ SHA - SHA1
+ SHA224
+ SHA256
+ SHA384
+ SHA512
+ MD5

Options :
--------------
>     -f      | -file         :: The output file to use
>     -t      | -threads      :: The number of threads to use
>     -l      | -lenght       :: Lenght of the passwords used for hash generation
>     -c      | -hash         :: The hash to crack
>     -x      | -charset      :: The charset in POSIX format
>                                Example: "'[a-Z]''[A-Z]''[0-9]'" or 'tes!'
>                                Use debug option or the script's debug lines to
>                                verify charset consistency
>     -k      | -algo         :: The type of the hash to crack.
>                                Currently supported algirithms are:
>                                md5 - sha - sha1 - sha224 - sha256 - sha384 - sha512
>     -d      | -debug        :: Debug options, Bash's 'set -x'
>     -v      | -version      :: Displays the version of this script
>     -h      | -help         :: Displays this help "

Usage examples :
--------------
###### Cracking "test" hash SHA1
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c 4e1243bd22c66e76c2ba9eddc1f91394e57f9f83 -x 'tse!' -k sha1`
###### Cracking "test" hash SHA224
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c 52f1bf093f4b7588726035c176c0cdb4376cfea53819f1395ac9e6ec -x 'tse!' -k sha224`
###### Cracking "test" hash SHA256
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2 -x 'tse!' -k sha256`
###### Cracking "test" hash SHA384
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c 109bb6b5b6d5547c1ce03c7a8bd7d8f80c1cb0957f50c4f7fda04692079917e4f9cad52b878f3d8234e1a170b154b72d -x 'tse!' -k sha384`
###### Cracking "test" hash SHA512
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c 0e3e75234abc68f4378a86b3f4b32a198ba301845b0cd6e50106e874345700cc6663a86c1ea125dc5e92be17c98f9a0f85ca9d5f595db2012f7cc3571945c123 -x 'tse!' -k sha512`
###### Cracking "test" hash MD5
`./bhash_crack.sh -f output_sample -t 8 -l 4 -c d8e8fca2dc0f896fd7cb4cb0031ba249 -x 'tse!' -k md5`

</br>**All suggestions and code improvements are welcome.**</br>
**Please tip me when performance improvements are possible. I would like to make this script quite efficient.**

# pPailleux
