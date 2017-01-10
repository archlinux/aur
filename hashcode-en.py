#!/usr/bin/env python3.6
#coding: utf-8

'''
HashCode
'''

import hashlib
from base64 import b64encode, b64decode
import codecs
import binascii
import re
from time import sleep
from sys import exit
import os

Limpar = "clear"

def Apresentacao():
	os.system(Limpar)
	print("""\033[31m

	 ▄  █ ██      ▄▄▄▄▄    ▄  █     ▄█▄    ████▄ ██▄   ▄███▄   
	█   █ █ █    █     ▀▄ █   █     █▀ ▀▄  █   █ █  █  █▀   ▀  
	██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   ██▀▀█     █   ▀  █   █ █   █ ██▄▄    
	█   █ █  █  ▀▄▄▄▄▀    █   █     █▄  ▄▀ ▀████ █  █  █▄   ▄▀ 
	   █     █               █      ▀███▀        ███▀  ▀███▀   
	  ▀     █               ▀                               
	       ▀                             \033[1mBy: Magno-Tutor\033[1;m

""")

def Again(frase, call):
	opcao1 = input(frase)
	if opcao1 == "y":
		call()
	elif opcao1 == "n":
		Escolha()
	else:
		Again(frase,call)


def Escolha():
	Apresentacao()
	print("""
	[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

	\033[31mA\033[1;m) \033[31mENCODE\033[1;m - \033[32mMD5\033[1;m
	\033[31mB\033[1;m) \033[31mENCODE\033[1;m - \033[32mSHA1\033[1;m
	\033[31mC\033[1;m) \033[31mENCODE\033[1;m - \033[32mSHA224\033[1;m
	\033[31mD\033[1;m) \033[31mENCODE\033[1;m - \033[32mSHA256\033[1;m
	\033[31mE\033[1;m) \033[31mENCODE\033[1;m - \033[32mSHA384\033[1;m
	\033[31mF\033[1;m) \033[31mENCODE\033[1;m - \033[32mSHA512\033[1;m
	\033[31mG\033[1;m) \033[31mENCODE/DECODE\033[1;m - \033[32mBASE64\033[1;m
	\033[31mH\033[1;m) \033[31mENCODE/DECODE\033[1;m - \033[32mBINARY\033[1;m
	\033[31mI\033[1;m) \033[31mENCODE/DECODE\033[1;m - \033[32mHEXADECIMAL\033[1;m
	\033[31mJ\033[1;m) \033[31mENCODE/DECODE\033[1;m - \033[32mCIPHER OF CESAR\033[1;m
	\033[31mK\033[1;m) \033[31mREVERSE\033[1;m - \033[32mTEXT\033[1;m
	\033[31mL\033[1;m) \033[31mREVERSE\033[1;m - \033[32mWORDS\033[1;m

	\033[31mq\033[1;m) EXIT
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "A" or opcao1 == "a":
		Md5()
	elif opcao1 == "B" or opcao1 == "b":
		Sha1()
	elif opcao1 == "C" or opcao1 == "c":
		Sha224()
	elif opcao1 == "D" or opcao1 == "d":
		Sha256()
	elif opcao1 == "E" or opcao1 == "e":
		Sha384()
	elif opcao1 == "F" or opcao1 == "f":
		Sha512()
	elif opcao1 == "G" or opcao1 == "g":
		Base64()
	elif opcao1 == "H" or opcao1 == "h":
		Binario()
	elif opcao1 == "I" or opcao1 == "i":
		Hexadecimal()
	elif opcao1 == "J" or opcao1 == "j":
		CifraDeCesar()
	elif opcao1 == "K" or opcao1 == "k":
		TextReverse()
	elif opcao1 == "L" or opcao1 == "l":
		WordsReverse()
	elif opcao1 == "q" or opcao1 == "q":
		exit(1)
	else:
		Escolha()

def Md5():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN MD5\033[1;m: ")
	hash_object = hashlib.md5(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN MD5 (y/n) ?:\033[1;m ", Md5)

def Sha1():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN SHA1\033[1;m: ")
	hash_object = hashlib.sha1(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN SHA1 (y/n) ?:\033[1;m ", Sha1)

def Sha224():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN SHA224\033[1;m: ")
	hash_object = hashlib.sha224(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN SHA224 (y/n) ?:\033[1;m ", Sha224)

def Sha256():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN SHA256\033[1;m: ")
	hash_object = hashlib.sha256(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN SHA256 (y/n) ?:\033[1;m ", Sha256)

def Sha384():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN SHA384\033[1;m: ")
	hash_object = hashlib.sha384(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN SHA384 (y/n) ?:\033[1;m ", Sha384)

def Sha512():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO ENCRYPT IN SHA512\033[1;m: ")
	hash_object = hashlib.sha512(mystring.encode())
	print("")
	print(hash_object.hexdigest())
	print("")
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE IN SHA512 (y/n) ?:\033[1;m ", Sha512)

def Base64Encode():
	Apresentacao()
	mystring = str(input("\033[32mPLACE THE TEXT YOU WANT TO TRANSFORM IN BASE64\033[1;m: ")) 
	print("")
	encode = b64encode(mystring.encode('utf-8')) 
	decode = encode.decode('utf-8')
	print(decode)
	print("") 
	Again("\n\033[1;36mWOULD YOU LIKE TO TRANSFORM ANOTHER TEXT IN BASE64 (y/n) ?:\033[1;m ", Base64Encode)

def Base64Decode():
	Apresentacao()
	mystring = str(input("\033[32mPLACE THE TEXT YOU WANT TO UNCOVER IN BASE64\033[1;m: ")) 
	print("")
	try:
		decode = b64decode(mystring).decode('utf-8')
		print(decode)
		print("")
	except:
		print("\n[\033[1;91m!\033[1;m] INCORRECT PADDING")
		sleep(3)
		Base64Decode()
	Again("\n\033[1;36mWISHES TO UNCOVER ANOTHER TEXT IN BASE64 (y/n) ?:\033[1;m ", Base64Decode)

def Base64():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - BASE64
\033[31m2\033[1;m) DECODE - BASE64
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		Base64Encode()
	elif opcao1 == "2":
		Base64Decode()
	else:
		Base64()


def BinarioEncode(encoding='utf-8', errors='surrogatepass'):
	Apresentacao()
	try:
		mystring = input("\033[32mPLACE THE TEXT YOU WANT TO TRANSFORM IN BINÁRIO\033[1;m: ")
		print("")
		bits = bin(int(binascii.hexlify(mystring.encode(encoding, errors)), 16))[2:]
		print(bits.zfill(8 * ((len(bits) + 7) // 8)))
		print("")
	except:
		print("\n[\033[1;91m!\033[1;m] VALUE ERROR")
		sleep(3)
		BinarioEncode()
	Again("\n\033[1;36mWOULD YOU LIKE TO TRANSFORM ANOTHER TEXT IN BINÁRIO (y/n) ?:\033[1;m ", BinarioEncode)

def BinarioDecode(encoding='utf-8', errors='surrogatepass'):
	Apresentacao()
	try:
		binario = input("\033[32mPLACE THE SEQUENCE OF NUMBERS YOU DESIRE TO UNCOVER IN BINARY\033[1;m: ")
		binario = binario.replace(" ", "")
		n = int(binario, 2)
		print("")
		print(int2bytes(n).decode(encoding, errors))
		print("")
	except:
		print("\n\n[\033[1;91m!\033[1;m] VALUE ERROR")
		sleep(3)
		BinarioDecode()
	Again("\n\033[1;36mWISHES TO UNCOVER ANOTHER SEQUENCE IN BINARY (y/n) ?:\033[1;m ", BinarioDecode)

def int2bytes(i):
	hex_string = '%x' % i
	n = len(hex_string)
	return binascii.unhexlify(hex_string.zfill(n + (n & 1)))


def Binario():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - BINARY
\033[31m2\033[1;m) DECODE - BINARY
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		BinarioEncode()
	elif opcao1 == "2":
		BinarioDecode()
	else:
		Binario()


def HexaEncode():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO TRANSFORM IN HEXADECIMAL\033[1;m: ")
	print("")
	encode = binascii.hexlify(bytes(mystring, "utf-8"))
	encode = str(encode).strip("b")
	encode = encode.strip("'")
	encode = re.sub(r'(..)', r'\1 ', encode).strip()
	print(encode)
	print("")
	Again("\n\033[1;36mWANT TO TRANSFORM ANOTHER TEXT IN HEXADECIMAL (y/n) ?:\033[1;m ", HexaEncode)

def HexaDecode():
	Apresentacao()
	try:
		mystring = input("\033[32mPLACE THE SEQUENCE OF CHARACTERS YOU DESIRE TO UNCOVER IN HEXADECIMAL\033[1;m: ")
		print("")
		decode = bytes.fromhex(mystring).decode('utf-8')
		print(decode)
		print("")
	except:
		print("\n[\033[1;91m!\033[1;m] VALUE ERROR")
		sleep(3)
		HexaDecode()
	Again("\n\033[1;36mWISHES TO UNCOVER ANOTHER SEQUENCE IN HEXADECIMAL (y/n) ?:\033[1;m ", HexaDecode)

def Hexadecimal():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - HEXADECIMAL
\033[31m2\033[1;m) DECODE - HEXADECIMAL
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		HexaEncode()
	elif opcao1 == "2":
		HexaDecode()
	else:
		Hexadecimal()


def TextReverseEncode():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO REVERSE\033[1;m: ")
	print("")
	print(mystring[::-1])
	print("")
	Again("\n\033[1;36mWANTS TO MAKE ANOTHER REVERSE (y/n) ?:\033[1;m ", TextReverseEncode)


def TextReverseDecode():
	Apresentacao()
	mystring = input("\033[32mPLACE TEXT YOU WANT TO UNCOVER THE REVERSE\033[1;m: ")
	print("")
	print(mystring[::-1])
	print("")
	Again("\n\033[1;36mWANT TO UNCOVER ANOTHER REVERSE (y/n) ?:\033[1;m ", TextReverseDecode)

def TextReverse():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - REVERSE-TEXT
\033[31m2\033[1;m) DECODE - REVERSE-TEXT
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		TextReverseEncode()
	elif opcao1 == "2":
		TextReverseDecode()
	else:
		TextReverse()


def WordsReverseEncode():
	Apresentacao()
	mystring = input("\033[32mPLACE THE TEXT YOU WANT TO REVERSE\033[1;m: ")
	print("")
	print(' '.join(mystring.split()[::-1]))
	print("")
	Again("\n\033[1;36mWANTS TO MAKE ANOTHER REVERSE (y/n) ?:\033[1;m ", WordsReverseEncode)

def WordsReverseDecode():
	Apresentacao()
	mystring = input("\033[32mPLACE TEXT YOU WANT TO UNCOVER THE REVERSE\033[1;m: ")
	print("")
	print(' '.join(mystring.split()[::-1]))
	print("")
	Again("\n\033[1;36mWANT TO UNCOVER ANOTHER REVERSE (y/n) ?:\033[1;m ", WordsReverseDecode)

def WordsReverse():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - REVERSE-WORDS
\033[31m2\033[1;m) DECODE - REVERSE-WORDS
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		WordsReverseEncode()
	elif opcao1 == "2":
		WordsReverseDecode()
	else:
		WordsReverse()


def CifraDeCesar():
	Apresentacao()
	print("""
[\033[1;32m*\033[1;m] CHOOSE ONE OF THE OPTIONS BELOW TO CONTINUE:

\033[31m1\033[1;m) ENCODE - CIPHER OF CESAR
\033[31m2\033[1;m) DECODE - CIPHER OF CESAR
""")
	opcao1 = input("\n\033[1;36m⟫⟫⟫\033[1;m ")
	if opcao1 == "1":
		ChamarBloco1()
	elif opcao1 == "2":
		ChamarBloco2()
	else:
		CifraDeCesar()


def cifrar(palavras, chave):
	abc = "abcdefghijklmnopqrstuvwxyz "
	text_cifrado = ''

	for letra in palavras:
		soma = abc.find(letra) + chave
		modulo = int(soma) % len(abc)
		text_cifrado = text_cifrado + str(abc[modulo])

	return text_cifrado


def decifrar(palavras, chave):
	abc = "abcdefghijklmnopqrstuvwxyz "
	text_cifrado = ''

	for letra in palavras:
		soma = abc.find(letra) - chave
		modulo = int(soma) % len(abc)
		text_cifrado = text_cifrado + str(abc[modulo])

	return text_cifrado

def ChamarBloco1():
	Apresentacao()
	try:
		c = str(input('\n\033[32mTEXT FOR CIPHER\033[1;m: ')).lower()
		n = int(input('\033[32mNUMERICAL KEY\033[1;m: '))
		print("\033[32mRESULT\033[1;m:", cifrar(c, n))
		print("")
	except:
		print("\n\n[\033[1;91m!\033[1;m] VALUE ERROR")
		sleep(3)
		ChamarBloco1()
	Again("\n\033[1;36mDESIRE TO DO ANOTHER ENCODE GIVES CIPHER OF CESAR (y/n) ?:\033[1;m ", ChamarBloco1)


def ChamarBloco2():
	Apresentacao()
	try:
		cc = str(input('\n\033[32mTEXT TO BE DECODE\033[1;m: ')).lower()
		cn = int(input('\033[32mNUMERICAL KEY\033[1;m: '))
		print("\033[32mRESULT\033[1;m:", decifrar(cc, cn))
		print("")
	except:
		print("\n\n[\033[1;91m!\033[1;m] VALUE ERROR")
		sleep(3)
		ChamarBloco2()
	Again("\n\033[1;36mDESIRE TO DO ANOTHER DECODE GIVES CIPHER OF CESAR (y/n) ?:\033[1;m ", ChamarBloco2)


Escolha()