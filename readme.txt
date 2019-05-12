 _ _            _ _            _ _            _ _            
| (_)_ __   ___| (_)_ __   ___| (_)_ __   ___| (_)_ __   ___ 
| | | '_ \ / _ \ | | '_ \ / _ \ | | '_ \ / _ \ | | '_ \ / _ \
| | | | | |  __/ | | | | |  __/ | | | | |  __/ | | | | |  __/
|_|_|_| |_|\___|_|_|_| |_|\___|_|_|_| |_|\___|_|_|_| |_|\___|
 
Print the Nth line of a file.

Usage:

$ cat hi.txt | line 2

will print the second line of the file hi.txt.

If negative line number specified we error out with a message. If line number
greater than what the file contains there will be no output. If one command
line argument provided we will error out with a message as well. Reads from
standard input, writes to standard output.

MIT licensed.
                                                            
