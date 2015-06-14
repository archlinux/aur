#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, stat
import argparse, glob
import pathlib, re, uuid

# Class holds all static variables
class Props(object):
	_openvpn_conf_dir='/etc/openvpn'
	_login_config='/etc/private-internet-access/login.conf'
	_system_connection_conf='/etc/private-internet-access/system-connection-example'
	_nm_conf_dir='/etc/NetworkManager/system-connections'
	
	@property
	def openvpn_conf_dir(self):
		return self._openvpn_conf_dir
	
	@property
	def login_config(self):
		return self._login_config
	
	@property
	def system_connection_conf(self):
		return self._system_connection_conf	
	
	@property
	def nm_conf_dir (self):
		return self._nm_conf_dir

# Checks if script has root permissions only.
def hasproperpermissions(filepath):
	st = os.stat(filepath)
	
	return bool(st.st_uid == 0 & st.st_gid == 0 & int(oct(stat.S_IMODE(os.stat(filepath).st_mode)) == "0o600"))

# Modifies OpenVPN configurations in /etc/openvpn
def openvpn_autologin (id, filename, enable):
	try:
		p = pathlib.Path(filename)
		with p.open() as f:
			content = f.read()
		
		if (enable):
			content = re.sub("(auth-user-pass)(?:.*)","auth-user-pass " + props.login_config, content)
		else:
			content = re.sub("(auth-user-pass)(?:.*)","auth-user-pass", content)
			
		with open(filename, "w") as f:
			f.write(content)
	except IOError:
		print ('Cannot access ' + filename + '.')
		exit (1)
				
# Modifies Network Connection configurations
def nm_autologin(id, filename, enable):
	if (enable):
		# Creates dictionary to hold replacement values
		re_dict = {}
	
		try:
			#Opens login.conf and reads login and passwords from file
			p = pathlib.Path(props.login_config)
			with p.open() as f:
				content = f.read().splitlines()
	
		except IOError:
			print ('Cannot access ' + props.login_config + '. Please make sure the file is created and readable by root.')
			
		else:
			re_dict["##username##"] = content[0]
			re_dict["##password##"] = content[1]
			
			re_dict["##id##"] = id
		
			# Creates uuid for configuration file
			re_dict["##uuid##"] = str(uuid.uuid4())
		
			# Retrieves remote address from OpenVPN configuration
			re_dict["##remote##"] = get_remote_address(filename)
	
			try:
				p = pathlib.Path(props.system_connection_conf)
				with p.open() as f:
					content = f.read()
		
			except IOError:
				print('Network Manager template missing from ' + props.system_connection_conf)
				
			else:
				nm_conf = props.nm_conf_dir + "/" + id
		
				try:
					#Opens Network Configurations and replaces options from the "re_dict" dictionary
					with open(nm_conf,"w") as f:
						f.write(multiple_replace(re_dict,content))
		
					os.chmod(nm_conf,0o600)
					os.chown(nm_conf,0,0)
				except IOError:
					#No Network Manager installed?
					pass		
	else:
		nm_conf = props.nm_conf_dir + "/" + id
		content = None
		
		try:
			p=pathlib.Path(nm_conf)
			with p.open() as f:
				content = f.read()
		
		except IOError:
			print (id + " connection does not exist as a Network Manager connection ... skipping")
			pass
		
		else:
			# Removes password from configuration file
			if (content):
				content = re.sub("\[vpn-secrets\]","",content)
				content = re.sub("password=.*","",content)
			
			try:
				with open(nm_conf, "w") as f:
					f.write(content)
			except IOError:
				print ("Failed to write config file for " + id)
				pass
			
# Gets remote address from OpenVPn files
def get_remote_address(filename):
	p = pathlib.Path(filename)
	
	with p.open() as f:
		contents = f.read()
	
	return ''.join(re.findall("(?:remote.)(.*)(?:.\d{4})",contents))

def multiple_replace(dict, text):
	# Create a regular expression  from the dictionary keys
	regex = re.compile("(%s)" % "|".join(map(re.escape, dict.keys())))
	
	# For each match, look-up corresponding value in dictionary
	return regex.sub(lambda mo: dict[mo.string[mo.start():mo.end()]], text) 

# Creates help menu
def menu():
	parser = argparse.ArgumentParser(description='Configures auto login for OpenVPN and NetworkMananger for PIA VPN Service')
	group = parser.add_mutually_exclusive_group(required=True)
	group.add_argument('-l','--auto-login',dest='auto_login',action='store_true',help='Enables auto-login')
	group.add_argument('-n','--no-auto-login',dest='auto_login',action='store_false',help='Disable auto-login')
	parser.add_argument('-v','--verbose',dest='verbose', action='store_true',help='Enables more verbose logging')
	parser.add_argument('--version',action='version', version='%(prog)s 1.2')
	
	return parser.parse_args();
	
if __name__ == "__main__":
	props = Props()
	args = menu()
	

	if os.getuid() > 0:
		print ('ERROR: You must run this script with administrative privilages!')
		exit(1)
		

	if not hasproperpermissions(props.login_config):
		print ('ERROR: ' + props.login_config + ' must be owned by root and not world readable!')
		exit(1)
		
	for filename in glob.glob(props.openvpn_conf_dir + '/*.conf') :
		id = re.sub('_',' ', re.match(r"^/(.*/)*(.+)\.conf$",filename).group(2))
		
		if (args.verbose):
			if (args.auto_login):
				print ("Enabling auto-logins for " + id + " remote server...")
			else:
				print ("Disablig auto-logins for " + id + " remote server...")
			
		openvpn_autologin(id, filename, args.auto_login)
		
		nm_autologin(id, filename, args.auto_login)