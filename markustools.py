#!/usr/bin/python
#Modules
import os

#Functions
def wronginput():
	print("Huh? I think you typed in the wrong thing.. Do me a favour and restart.")

#Introduction
print("Welcome to markustools, a specially created tool for troubleshooting, games, installation and other plain, dumb stuff")
option = input("\nPlease select your option:\nh) Help\n1) Exiting \n2) Goofy stuff\n3) Creating enviroment variables\n")

#Help
if option == "h":
	os.system("clear")
	print("Markustools: A program designed for stuff you don't need\n\nWhat is markustools, you may be asking? Markustools is\n1) A program for silly stuff\n2) A program for making stuff quicker\n3) A program for me to develop my coding.\n\nFor my own sake, if anything goes wrong with markustools, you can't sue me and/or batter me to death. Under the GPL license, you are free to edit, distrubute, sell and any other verbs with this package. BUT! You must stick to the terms and conditions..\n\nTerms and Conditions (T&C):\n1) Don't use it for spreading virus/causing mishap and/or malicious programs\n2) You can't use it to be moody\n\nThanks for reading!")

#Exiting DE/Program
elif option == "1":
	exittype = input("Exit the desktop or exit this program?\n1) markustools\n2) Desktop") 
	#Exit markustools
	if "exittype" == "1":
		print("Now exiting markustools..")
		exit()
	#Exit DM
	elif exittype == "2":
		print("Now exiting DM..")
		de = input("Hyprland or another DM/Tiling WM?\n1) Hyprland\n2) Another\n")
		#Hyprland
		if de == "1":
			print("Now exiting hyprland using hyprctl dispatch exit..")
			os.system("hyprctl dispatch exit")
		#Other
		elif de == "2":
			username = input("What is your username? ")
			print("Now exiting, Mrs./Mr. " + username + "..")	 
			#Kill all processes of that user so it restartes login session
			os.system("pkill -KILL -u " + username)
		else:
			wronginput()
	else:
		wronginput()

#Goofy linux commands
elif option == "2":
	goofy = input("What silly command do you want to execute?\n1) Speaking animals\n2) Crazy info\n3) Shocking matrixes\n")
	#Pipe fortune into cowsay to make it look like it's speaking wisdom
	if goofy == "1":
		os.system("fortune | cowsay -r")
	
	#Neofetch: you know what it is
	elif goofy == "2":
		os.system("neofetch")
	
	#Cmatrix/matrix
	elif goofy == "3":
		ready = input("Are you ready? Type YEE (with exactly 1 Y and 2 Es, all caps)")
		if ready == "YEE":
			os.system("cmatrix")
		else:
			wronginput()
	else:
		wronginput()
	
#Making enviroment variables
elif option == "3":
	var = input("Variable name? ")
	varva = input("And value? ")
	print("Now hacking the linux kernel..")
	os.system("uname -r")
	os.system("echo $SHELL")
	os.system("env " + var + "=" + varva)
	reboot = input("Done. It's recommended to reboot! Do it now? Y/N ")
	if reboot == "Y":
		os.system("reboot")
	elif reboot == "N":
		exit()
	else:
		wronginput()
else:
	wronginput()
