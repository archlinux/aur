#!/usr/bin/env python3
import instaloader
from colorama import Fore
import requests
import subprocess
import os
from translate import Translator
import readline
import signal
import sys
num=0
cl=Fore.RESET
t=''
num=0
loc=''
def fun():
    global t
    global sc
    global num
    print(f"{Fore.LIGHTRED_EX}>>>>>>>>>>>>>>>>>>>>>>>>>>|{Fore.YELLOW}{num}{Fore.LIGHTRED_EX}|<<<<<<<<<<<<<<<<<<<<<<<<<<<<"+Fore.RESET)
    print(f'{Fore.BLUE}  1-{Fore.LIGHTYELLOW_EX} user username{Fore.RESET}{Fore.MAGENTA}        [username]{Fore.GREEN} |or|{Fore.LIGHTYELLOW_EX}   y {Fore.RESET}{Fore.MAGENTA}    [username]')
    print(f'{Fore.BLUE}  2-{Fore.LIGHTYELLOW_EX} get profile url{Fore.RESET}{Fore.MAGENTA}      [username]{Fore.GREEN} |or|{Fore.LIGHTYELLOW_EX}   gpr {Fore.RESET}{Fore.MAGENTA}  [username]')
    print(f'{Fore.BLUE}  3-{Fore.LIGHTYELLOW_EX} get list profile{Fore.RESET}{Fore.MAGENTA}     [username]{Fore.GREEN} |or|{Fore.LIGHTYELLOW_EX}   glp {Fore.RESET}{Fore.MAGENTA}  [username]')
   # print(f"{Fore.BLUE}  4-{Fore.LIGHTYELLOW_EX} does username exist{Fore.MAGENTA} [username]{Fore.RESET}{Fore.GREEN} |or|{Fore.LIGHTYELLOW_EX}   due {Fore.RESET}{Fore.MAGENTA}   [username]")
    print(f'{Fore.BLUE}  4-{Fore.LIGHTYELLOW_EX} show pic profile{Fore.RESET}{Fore.MAGENTA}     [username] {Fore.GREEN}|or|{Fore.LIGHTYELLOW_EX}   spp {Fore.RESET}{Fore.MAGENTA}  [username]')
    print(f'{Fore.BLUE}  5-{Fore.LIGHTYELLOW_EX} tr [ Translate (bio or name)] ')
    print(f"{Fore.BLUE}  6-{Fore.LIGHTYELLOW_EX} or Number list{Fore.MAGENTA}{Fore.RESET} ")
   
    
    print(Fore.RESET)
    username1=''
    sc=(f'Script :{cl} ')
    t = input(sc)
    readline.add_history(t)

    ####################
    if t.startswith('user ') or t.startswith('y ') or t.startswith('1 '):
        if t.startswith('user '):
            username1=t[5:]

        else:
            username1=t[2:]
        L = instaloader.Instaloader()
        profile = instaloader.Profile.from_username(L.context, username1)
        ppd=profile.username
        print("\n __________++__________")
        print(profile.full_name)

    elif t.startswith('get profile url ') or t.startswith('gpr ') or t.startswith('2 '):
        if t.startswith("show pic profile "):
            username1=t[16:]
        elif t.startswith("gpr "):
            username1=t[4:]
        else:
            username1=t[2:]

        print(f"\n{Fore.LIGHTRED_EX} __________++__________{Fore.RESET}")
        print(f" 1- https://www.instagram.com/{t[16:]}/")
        print(f" 2- www.instagram.com/{t[16:]}")


    elif t.startswith('get list profile ') or t.startswith('glp ') or t.startswith('3 '):
        if t.startswith('get list profile '):
            username1=t[17:]
        elif t.startswith('glp '):
            username1=t[4:]
        else:
            username1=t[2:]

        L = instaloader.Instaloader()
        profile = instaloader.Profile.from_username(L.context, username1)
        print(Fore.LIGHTRED_EX + "--------------------------" + Fore.RESET)
        print("\n \n ")
        print("**************************************")
        print(Fore.YELLOW+' Name :'+ Fore.BLUE, profile.full_name)
        print(Fore.YELLOW+' User :'+ Fore.BLUE, profile.username)
        print(Fore.YELLOW+' Followers :'+ Fore.BLUE, profile.followers)
        print(Fore.YELLOW+' Followees :'+ Fore.BLUE, profile.followees)
        print(Fore.YELLOW+" Bio :"+ Fore.BLUE, profile.biography)
        print("\n \n ",Fore.RESET)
        print("**************************************")
    # elif t.startswith('does username exist ') or t.startswith('due ') or t.startswith('4 ') :
    #       if t.startswith('does username exist '):
    #           username1=t[20:]
    #       elif t.startswith('due '):
    #           username1=t[4:]
    #       else:
    #         username1=t[2:]
        # L1 = instaloader.Instaloader()
        # profile = instaloader.Profile.from_username(L.context, username1)

        #ex: 

    elif t.startswith('help'):
        print('1 -  user username or y  [user username al_2_1_6] [ex:y al_2_1_6]')
        print('2 -  get profile url or gpr [ex: 2 al_2_1_6 ] [ex: gpr al_2_1_6 ]')
        print('3 -  get list profile or glp [ex: get profile list al_2_1_6] [ex: glp al_2_1_6]')
        print('4 -  show pic profile or  spp [ex: show pic profile al_2_1_6] [ex: spp al_2_1_6]')
        print('5 - Choosing a number from a list to execute a command without writing a line as an example [ex: 1 al_2_1_6] [ex: 2 al_2_1_6] [ex: 3 al_2_1_6] [ex: 4 al_2_1_6]')



    elif t.startswith('show pic profile ') or t.startswith('spp ') or t.startswith('4 '):
        if t.startswith("show pic profile "):
            username1=t[17:]
        elif t.startswith('spp '):
            username1=t[4:]
        else:
            username1=t[2:]

        profile_pic_path = download_profile_pic(username1)
        if profile_pic_path:
            open_profile_picture(profile_pic_path)
        #code exit 
    if t.startswith('exit') or t.startswith("exit()"):
        exit()
    
        #######################################################################
    if t.startswith("tr") or t.startswith("5"):
        global loc
       
        usert=input(" User : ")
        readline.add_history(usert)
        
        if usert.startswith("back") or usert.startswith("back()"):
            return fun()
        L = instaloader.Instaloader()
        pro= instaloader.Profile.from_username(L.context,usert )
        userpro=input(" translate Name or bio : ")
        
        if userpro.startswith('bio') or userpro.startswith('Bio'):
            loc=str(pro.biography)
        elif userpro.startswith('name') or userpro.startswith("Name"):
            loc=pro.full_name
        if userpro.startswith("back") or userpro.startswith("back()"):
            return fun()
        userto=input(' translate to ? : ')
        if userto.startswith('back') or userto.startswith('back()'):
            return fun()
        userfr=input(' translate from ? : ')
        if userfr.startswith('back') or userfr.startswith('back()'):
            return fun()
        
       
        def translate_to_arabic(text):
            translator = Translator(from_lang=userto, to_lang=userfr)
            translated_text = translator.translate(text)
            return translated_text

        def main():
            english_text = loc
            arabic_translation = translate_to_arabic(english_text)
            print("\n Translated text:", arabic_translation)

        if __name__ == "__main__":
            main()
        else:
            fun()
        

        ##################
def download_profile_pic(username1):
    loader = instaloader.Instaloader()
    profile = instaloader.Profile.from_username(loader.context, username1)
    profile_pic_url = profile.profile_pic_url
    response = requests.get(profile_pic_url)
    if response.status_code == 200:
        profile_pic_path = f"{username1}_profile_pic.jpg"
        with open(profile_pic_path, 'wb') as f:
            f.write(response.content)
        return profile_pic_path

    else:
        print("Failed to download profile picture.")
        return None

def open_profile_picture(profile_picture_path):
    try:
        subprocess.run(["xdg-open", profile_picture_path])
    except Exception as e:
        print(f"Failed to open profile picture: {e}")
    print("press Enter")
#####################


####################################################



def signal_handler(sig, frame):
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

while True: 
    num+=1
    fun()
   
