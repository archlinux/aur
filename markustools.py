#!/usr/bin/python
#Modules
import os

#Introduction
print("READ CAREFULLY: markustools reqires an input from the list shown, or else an error will occur. As of now, it's not patched because I'm too lazy to lol")
print("Welcome to markustools, a specially created tool for troubleshooting, games, installation and other plain, dumb stuff")
option = input("\nPlease select your option:\nh) Help\n1) Exiting \n2) Editing a file\n3) Goofy stuff\n4) Cloning github repos\n5) Creating enviroment variables\n")

#Help
if option == "h":
	os.system("clear")
	print("Markustools: A program designed for stuff you don't need\n\nWhat is markustools, you may be asking? Markustools is\n1) A program for silly stuff\n2) A program for making stuff quicker\n3) A program for me to develop my coding.\n\nFor my own sake, if anything goes wrong with markustools, you can't sue me and/or batter me to death. Under the GPL license, you are free to edit, distrubute, sell and any other verbs with this package. BUT! You must stick to the terms and conditions..\n\nTerms and Conditions (T&C):\n1) Don't use it for spreading virus/causing mishap and/or malicious programs\n2) You can't use it to be moody\n\nThanks for reading!")

#Exiting DE/Program
if option == "1":
	exittype = input("Exit the desktop or exit this program?\n1) markustools\n2) Desktop") 
	#Exit markustools
	if "exittype" == "1":
		print("Now exiting markustools..")
		exit()
	#Exit DM
	if exittype == "2":
		print("Now exiting DM..")
		de = input("Hyprland or another DM/Tiling WM?\n1) Hyprland\n2) Another\n")
		#Hyprland
		if de == "1":
			print("Now exiting hyprland using hyprctl dispatch exit..")
			os.system("hyprctl dispatch exit")
		#Other
		if de == "2":
			username = input("What is your username? ")
			print("Now exiting, Mrs./Mr. " + username + "..")	 
			#Kill all processes of that user so it restartes login session
			os.system("pkill -KILL -u " + username)

#Edit files via nano
if option == "2":
	pathfile = input("Path of file? ")
	os.system("nano " + pathfile)

#Goofy linux commands
if option == "3":
	goofy = input("What silly command do you want to execute?\n1) Speaking animals\n2) Crazy info\n3) Shocking matrixes\n")
	#Pipe fortune into cowsay to make it look like it's speaking wisdom
	if goofy == "1":
		os.system("fortune | cowsay -r")
	
	#Neofetch: you know what it is
	if goofy == "2":
		os.system("neofetch")
	
	#Cmatrix/matrix
	if goofy == "3":
		ready = input("Are you ready? Type YEE (with exactly 1 Y and 2 Es, all caps)")
		if ready == "YEE":
			os.system("cmatrix")
	
#Cloning github repos via git
if option == "4":
	repo = input("Link to repo? (Click green code button with a -> pointing down) ")			
	save = input("Where to save? ")
	os.system("git clone " + repo + " " + save)
	
#Making enviroment variables
if option == "5":
	var = input("Variable name? ")
	varva = input("And value? ")
	print("Now hacking the linux kernel..")
	os.system("uname -r")
	os.system("echo $SHELL")
	os.system("env " + var + "=" + varva)
	reboot = input("Done. It's recommended to reboot! Do it now? Y/N ")
	if reboot == "Y":
		os.system("reboot")
	if reboot == "N":
		exit()

