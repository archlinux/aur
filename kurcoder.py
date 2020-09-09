#!/usr/bin/env python3
import os
import sys
import hashlib
import binascii
import string
import base64
import ipcalc
from codecs import encode

# colors
W  = '\033[0m'  # white (default)
R  = '\033[1;31m' # red
P  = '\033[1;35m' # purple
C  = '\033[1;36m' # cyan

# Converts Hex to ASCII
def hex2ascii():
    ascii = str(input(P+' Input Hexadecimal '+C+'> '+W))
    if ascii == 'exit' or ascii == 'q' :
        exit()
    elif ascii == 'menu' :
        menu()
        main()
    else:
        print(C+' > '+ (bytes.fromhex(ascii).decode('utf-8')))
    main()

# Converts ASCII to Hex
def ascii2hex():
    hex = str(input(P+' Input ASCII '+C+'> '+W))
    hex_binary = hex.encode(encoding='utf_8')
    hex_text = hex_binary.hex()
    print(C+' > '+ (hex_text))
    main()

# Convert Hex to Binary
def hex2bin():
    hex_text = str(input(P+' Input Hexadecimal: '+C+'> '+W))
    if hex_text == 'exit' or hex_text == 'q' :
        exit()
    elif hex_text == 'menu' :
        menu()
        main()
    else:
        scale = 16
        bin_out = "{0:08b}".format(int(hex_text, 16))
        print(str(C+' > '+(bin_out)))
        main()

# Convert Binary to Hex
def bin2hex():
    bin_text = str(input(P+' Input Binary: '+C+'> '+W))
    if bin_text == 'exit' or bin_text == 'q' :
        exit()
    elif bin_text == 'menu' :
        menu()
        main()
    else:
        hex_out = hex(int(bin_text, 2))
        print(str(C+' > '+(hex_out)))
        main()

# Convert Hex to Decimal
def hex2dec():
    hex_text = str(input(P+' Input Hexadecimal: '+C+'> '+W))
    if hex_text == 'exit' or hex_text == 'q' :
        exit()
    elif hex_text == 'menu' :
        menu()
        main()
    else:
        decimal_text = int(hex_text, 16)
        print(str(C+'> '+str(decimal_text)))
        main()

# Convert Decimal to Hex
def dec2hex():
    dec_text = str(input(P+' Input Decimal: '+C+'> '+W))
    if dec_text == 'quit' or dec_text == 'q' :
        exit()
    elif dec_text == 'menu' :
        menu()
        main()
    else:
        hex_text = hex(int(dec_text))
        print(str(C+'> '+(hex_text)))
        main()

# Hexdump
def hexdumper():
    filename = (input(P+' Input filename to hexdump: '+C+'> '+W))
    if filename == 'exit' or filename == 'q' :
        exit()
    elif filename == 'menu' :
        menu()
        main()
    else:
        try:
            filedump = open(filename, 'rb')
        except:
            print(C+' File not found. Please verify filename, or the path is correct'+W) #+W, sys.exc_info()[0])
            hexdumper()
        counter = 0
        offset = 0
        byte = filedump.read(8)
        ascii_list = []
        i = 1
        if len(byte) == 0:              # checks if the file is empty
            print(C+' File is empty, Please try again'+W)
            hexdumper()
        print(C+'%08x ' % (offset), end = ' ')
        offset += int(len(byte))
        while len(byte)>0:
            for b in byte:
                print('%02x' %b, end = ' ')
                c = chr(b)
                ascii_list.append(c)
            print(' ', end = '')
            if len(ascii_list)>=16:      # prints ascii values of hex
                print('|', end = '')
                for c in ascii_list:
                    if ord(c) < 33:
                        print ('.',end ='')
                    elif ord(c) > 126:
                        print ('.',end='')
                    else:
                        print(c,end ='')
                print('|',end='')
                ascii_list[:] = []
            if (offset % 16 == 0):      # pints previous bits
                    print('')
                    print('%08x ' % (offset), end = ' ')
            prev = byte                 # refreshes all values 
            byte = filedump.read(8)
            offset += int(len(byte))
        if ascii_list:                   # verifies if a list has a value inside
            if (offset % 16 < 8):       # formats the last line if less than 8 bytes are read
                while i <= 25:
                    print(' ',end='')
                    i= i+1
            i = 1
            while i <= 24 - (len(prev)*3): # formatting the last line
                print (' ', end ='')
                i= i+1
            print('|', end ='')
            for c in ascii_list:
                if ord(c) < 33:
                    print ('.',end ='')
                elif ord(c) > 126:
                    print ('.',end='')
                else:
                    print(c,end ='')
            print('|')
            print('%08x ' % (offset))
            main()
        else:
            print('')

# Check MD5 / SHA1 / SHA256 checksum
def filesum():
    filename = (input(P+' Input filename: '+C+'> '+W))
    if filename == 'exit' or filename == 'q' :
        exit()
    elif filename == 'menu' :
        menu()
        main()
    else:  
        hash_md5 = hashlib.md5()
        hash_sha1 = hashlib.sha1()
        hash_sha256 = hashlib.sha256()
        with open(filename, 'rb') as f:
            for chunk in iter(lambda: f.read(4096), b''):
                hash_md5.update(chunk)
                hash_sha1.update(chunk)
                hash_sha256.update(chunk)
            print(P+' MD5 Checksum  '+C+'> '+ (hash_md5.hexdigest()))
            print(P+' SHA1 Checksum '+C+'> '+(hash_sha1.hexdigest()))
            print(P+' SHA256 Checksum '+C+'> '+(hash_sha256.hexdigest()))
            main()

# Decodes ROT13
def derot13():
    rot = str(input(P+' Input Cipher '+C+'> '+W))
    print(C+' > '+ (encode(rot, 'rot_13')))
    main()

# Encodes Base64
def enbase64():
    encode_text = str(input(P+' Input Base64 to encode '+C+'> '+W))
    message_bytes = encode_text.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    encode_message = base64_bytes.decode('ascii')
    print(C+'> '+ (encode_message))
    main()

# Decodes Base64
def debase64():
    decode_text = str(input(P+' Input Base64 to decode '+C+'> '+W))
    if decode_text == 'exit' or decode_text == 'q' :
        exit()
    elif decode_text == 'menu' :
        menu()
        main()
    else:
        base64_bytes = decode_text.encode('ascii')
        message_bytes = base64.b64decode(base64_bytes)
        decode_message = message_bytes.decode('ascii')
        print(C+'> '+ (decode_message))
        main()

# Encodes ASCII85
def enbase85():
    encode_text = str(input(P+'Input ASCII to encode '+C+'> '+W))
    message_bytes = encode_text.encode('ascii')
    base85_bytes = base64.a85encode(message_bytes)
    encode_message = base85_bytes.decode('ascii')
    print(C+'> '+ (encode_message))
    main()

# Decodes ASCII85
def debase85():
    decode_text = str(input(P+' Input ASCII85 to decode '+C+'> '+W))
    if decode_text == 'exit' or decode_text == 'q' :
        exit()
    elif decode_text == 'menu' :
        menu()
        main()
    else:
        base85_bytes = decode_text.encode('ascii')
        message_bytes = base64.a85decode(base85_bytes)
        decode_message = message_bytes.decode('ascii')
        print(C+'> '+ (decode_message))
        main()

# CIDR Calculator
def cidr():
    cidr_result = str(input(P+' Input IP with subnet '+C+'> '+W))
    if cidr_result == 'exit' or cidr_result == 'q' :
        exit()
    elif cidr_result == 'menu' :
        menu()
        main()
    else:
        subnet = ipcalc.Network(cidr_result)
        for c in subnet:
            print(C+'> '+ str(c))
        cmd = str(input(C+"Do you want to save this to a file called [ "+P+"subnet.txt"+C+" ] ? [ "+P+"Yes"+C+" ] or [ "+P+"No"+C+" ]\n \n > "+W))
        if cmd == 'y' or cmd == 'yes' or cmd == 'Yes' :
            with open('subnet.txt', 'a+') as f:
                for c in subnet:
                    f.write(str(c) + '\n')
            main()
        elif cmd == 'n' or cmd == 'no' or cmd == 'No' :
            main()

# IP to Binary
def ip2bin():
    ip2bin_text = str(input(P+' Input IP '+C+'> '+W))
    if ip2bin_text == 'exit' or ip2bin_text == 'q' :
        exit()
    elif ip2bin_text == 'menu' :
        menu()
        main()
    else:
        ip2bin_result = '.'.join(map(str,['{0:08b}'.format(int(x)) for x in ip2bin_text.split('.')]))
        print(C+'> '+ (ip2bin_result))
        main()

def banner():
    try:
        os.system('cls')
        raise ValueError('Error')
    except Exception:
        os.system('clear')
    print ('')
    print (C+'  Welcome to Kurcoder v.0.0.1')
    print ('')
    print (C+' '+C+'    Created by: 0xKurome')
    print (P+'     GitHub: ['+C+'0xkurome'+P+']')
    print (P+'     Insta:  ['+C+'0xkurome'+P+']')
    print ('')

def menu():
        print ('')
        print (C+' [01]'+P+' Convert Hexadecimal to ASCII')
        print (C+' [02]'+P+' Convert ASCII to Hexadecimal')
        print (C+' [03]'+P+' Convert Hexadecimal to Binary')
        print (C+' [04]'+P+' Convert Binary to Hexadecimal')
        print (C+' [05]'+P+' Convert Hexadecimal to Decimal')
        print (C+' [06]'+P+' Convert Decimal to Hexadecimal')
        print (C+' [07]'+P+' Hexdump a file')
        print (C+' [08]'+P+' MD5, SHA1 & SHA256 checksum')
        print ('  -  ')
        print (C+' [09]'+P+' Decode ROT13 Cipher')
        print (C+' [10]'+P+' Encode Base64')
        print (C+' [11]'+P+' Decode Base64')
        print (C+' [12]'+P+' Encode ASCII85')
        print (C+' [13]'+P+' Decode ASCII85')
        print ('  -  ')
        print (C+' [14]'+P+' IP Subnet Calculator')
        print (C+' [15]'+P+' Convert IP to Binary')
        

def main():
    print ('')
    cmd = str(input(C+" Type [ "+P+"menu"+C+" ] to see available options\n Type [ "+P+"exit"+C+" ] to close the program\n \n > "+W))
    if cmd == 'exit' or cmd == 'quit' or cmd == 'q' :
        exit()
    elif cmd == 'menu' or cmd == 'm' :
        banner()
        menu()
        main()
    elif cmd == 'clear' or cmd == 'c' :
        banner()
        main()
    elif cmd == '1' or cmd == '01' :
        try:
            hex2ascii()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            hex2ascii()
    elif cmd == '2' or cmd == '02' :
        try:
            ascii2hex()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            ascii2hex()
    elif cmd == '3' or cmd == '03' :
        try:
            hex2bin()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            hex2bin()
    elif cmd == '4' or cmd == '04' :
        try:
            bin2hex()
        except Exception:
            print(C+'\n Incorrect format, Please try again')
            bin2hex()
    elif cmd == '5' or cmd == '05' :
        try:
            hex2dec()
        except Exception:
            print(C+'\n Incorrect format, Please try again')
            hex2dec()
    elif cmd == '6' or cmd == '06' :
        try:
            dec2hex()
        except Exception:
            print(C+'\n Incorrect format, Please try again')
            dec2hex()
    elif cmd == '7' or cmd == '07' :
        try:
            hexdumper()
        except Exception:
            print(C+'\n Incorrect format, Please try again')
            hexdumper()
    elif cmd == '8' or cmd == '08' :
        try:
            filesum()
        except Exception:
            print(C+'\n Incorrect file, Please try again')
            filesum()
    elif cmd == '9' or cmd == '09' :
        try:
            derot13()
        except Exception:
            print(C+'\n Incorrect file, Please try again ')
            derot13()
    elif cmd == '10' :
        try:
            enbase64()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            enbase64()
    elif cmd == '11' :
        try:
            debase64()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            debase64()
    elif cmd == '12' :
        try:
            enbase85()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            enbase85()
    elif cmd == '13' :
        try:
            debase85()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            debase85()
    elif cmd == '14' :
        try:
            cidr()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            cidr()
    elif cmd == '15' :
        try:
            ip2bin()
        except Exception:
            print(C+'\n Incorrect format, Please try again ')
            ip2bin()

    else :
        print ('')
        print (P+" Command [ "+C+"" +cmd+ ""+P+" ] Not Found")
        main()

banner()
main()

