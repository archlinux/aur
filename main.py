#!/usr/bin/python

import random
import string
import argparse
import pyperclip
import math
import requests
import hashlib

parser = argparse.ArgumentParser(
    description = """A small script that help you generate password and check for the password strength
""",
    formatter_class = argparse.RawTextHelpFormatter
                            )

parser.add_argument('-a', dest='all', action='store_true',
                    default=False,
                    help='Generate password with 12 char length and all the groups are selected [the same as running passtools -lunp]'
                    )

parser.add_argument('-s', dest='length', type=int, default=12,
                    help='Generate password with specifiend size,length (default: 12)'
                    )
parser.add_argument('-d', dest='digits', action='store_true',
                    default=False,
                    help='Include numbers in the passwrod (default: False)'
                    )
parser.add_argument('-u', dest='upper_letters', action='store_true',
                    default=False,
                    help='Include upper chars in the passwrod (default: False)'
                    )
parser.add_argument('-l', dest='lower_letters', action='store_true',
                    default=False,
                    help='Include lower chars in the passwrod (default: False)'
                    )
parser.add_argument('-p', dest='punctuation', action='store_true',
                    default=False,
                    help='Include special chars in the passwrod (default: False)'
                    )
parser.add_argument('-r', dest='repeat', action='store_true',
                    default=False,
                    help='Allow repeated char (default: False)')
parser.add_argument('-c', dest='copy', action='store_true',
                    default=False,
                    help='Copy the passwrod to clipboard (default: False)'
                    )
parser.add_argument('-e', dest='entropy', action='store_true',
                    default=False,
                    help='print the strength of the password (default: False)'
                    )
parser.add_argument('-x', dest='password', type=str,
                    default=None,
                    help='Password to proccess'
                    )

args = parser.parse_args()


if not (args.all or args.digits or args.upper_letters
        or args.lower_letters or args.punctuation or args.repeat or args.password):
    parser.error('Type passtools -h for help')
elif args.all and (args.digits or args.upper_letters
                   or args.lower_letters or args.punctuation):
    parser.error('You can only use -r, -e, -c, -s with -a')
elif args.password and (args.digits or args.upper_letters
                or args.lower_letters or args.punctuation
                or args.repeat or args.all):
    parser.error('You can only use -e, -c with -x')
elif args.length < 4:
    parser.error('Size of the passwrod must be greater than 3')


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def seconds_to_time(seconds):
    units = {
        'century': 100 * 24 * 60 * 60 * 365,
        'year': 24 * 60 * 60 * 365,
        'month': 24 * 60 * 60 * 30,
        'week': 24 * 60 * 60 * 7,
        'day': 24 * 60 * 60,
        'hour': 60 * 60,
        'minute': 60,
        'second': 1,
        }

    time = ''
    for unit in units:
        count = math.floor(seconds / units[unit])

        if unit == 'century' and count > 1500:
            return 'Infinty'

        if count == 1:
            time = time + f', {count} {unit}'
        elif count > 1:
            if unit == 'century':
                time = time + f', {count} centuries'
            else:
                time = time + f', {count} {unit}s'

        seconds = seconds % units[unit]
    if len(time) == 0:
        return "0 seconds"
    return time[2:]





class passtools:
    password = ''
    strength_measure = {
            0: f'{bcolors.FAIL}Is this even a password{bcolors.ENDC}',
            1: f'{bcolors.FAIL}Is this even a password{bcolors.ENDC}',
            2: f'{bcolors.FAIL}Very bad{bcolors.ENDC}',
            3: f'{bcolors.FAIL}Bad{bcolors.ENDC}',
            4: f'{bcolors.WARNING}Intermediate{bcolors.ENDC}',
            5: f'{bcolors.OKBLUE}Good{bcolors.ENDC}',
            6: f'{bcolors.OKGREEN}Excellent{bcolors.ENDC}',
            }
    
    
    def __init__(self, password = ''):
        self.password = password
        

    def generate_password(
        self,
        length,
        digits,
        upper_letters,
        lower_letters,
        punctuation,
        repeat,
        ):
        """ return a random password generated
            with spiceifi including digits, upper , lower, special charcters or not 
        """

        selected_letters = []
        password = []

        if digits:
            selected_letters = selected_letters + list(string.digits)
            password = password + random.sample(list(string.digits), 1)

        if upper_letters:
            selected_letters = selected_letters + list(string.ascii_uppercase)
            password = password + random.sample(list(string.ascii_uppercase), 1)

        if lower_letters:
            selected_letters = selected_letters + list(string.ascii_lowercase)
            password = password + random.sample(list(string.ascii_lowercase), 1)

        if punctuation:
            selected_letters = selected_letters + list(string.punctuation)
            password = password + random.sample(list(string.punctuation), 1)

        # handle empty set of letters and the requested password length is greater than it without repeat

        if len(selected_letters) == 0:
            raise Exception('Cannot generate password with empty set')
        elif len(selected_letters) < length and not repeat:
            raise Exception('The required length is impossible with this set of letters use -r flag')

        random.shuffle(selected_letters)

        if repeat:
            password = password + random.choices(selected_letters, 
                                                k=length - len(password))
        else:
            password = password + random.sample(selected_letters, 
                                                length - len(password))

        random.shuffle(password)
        
        self.password = ''.join(password)

        return ''.join(password)


    def password_strength(self):

        strength = 0
        

        if any(letter in string.ascii_lowercase for letter in self.password):
            strength = strength + 1

        if any(letter in string.ascii_uppercase for letter in self.password):
            strength = strength + 1

        if any(letter in string.digits for letter in self.password):
            strength = strength + 1

        if any(letter in string.punctuation for letter in self.password):
            strength = strength + 1

        if len(self.password) >= 20:
            strength = strength + 2
        elif len(self.password) >= 8:
            strength = strength + 1

        return self.strength_measure[strength]

    def crack_time(self):
        keys_per_second = 4 * 10 ** 9
        all_possible_letters = list(string.ascii_lowercase) + list(string.ascii_uppercase) + list(string.digits) + list(string.punctuation)
        number_of_keys = 1
        # time to crack
        for c in self.password:
            number_of_keys = number_of_keys * (all_possible_letters.index(c) + 1)
        
        # number_of_keys = possible_chars_count ** len(self.password)
        seconds_to_crack = number_of_keys / keys_per_second

        return seconds_to_time(seconds_to_crack)


    def pwnedpassword(self):
         # api url: https://api.pwnedpasswords.com/range/{first 5 digis of sha1}
        hash_object = hashlib.sha1(self.password.encode('utf-8'))
        password_hash = hash_object.hexdigest()
        hash_prefix = password_hash[:5].upper()
        rest_of_hash = password_hash[5:].upper()

       
        try:
            api_request = requests.get(f'https://api.pwnedpasswords.com/range/{format(hash_prefix)}')
            api_res = api_request.text
        
            if rest_of_hash in api_res:
                return True

            return False
        except requests.ConnectionError:
            raise "Can't connect to the internet."
        
      


if __name__ == '__main__':

    utility = passtools()
    if args.password == None:
        if args.all:
            utility.generate_password(
                args.length,
                True,
                True,
                True,
                True,
                args.repeat,
                )
        else:
            utility.generate_password(
                args.length,
                args.digits,
                args.upper_letters,
                args.lower_letters,
                args.punctuation,
                args.repeat,
                )
    else:
        utility.password = args.password

    print(utility.password)

    if args.copy:
        pyperclip.copy(utility.password)

    if args.entropy:
        password_entropy = utility.password_strength()
        time_to_crack = utility.crack_time()
        
        

        print(f'{bcolors.HEADER}Password strength is: {password_entropy}.{bcolors.ENDC}')
        print(f'{bcolors.HEADER}It will take {time_to_crack} to break it.{bcolors.ENDC}')
        try:
            have_been_pwned = utility.pwnedpassword()
            if have_been_pwned:
                print(f"{bcolors.FAIL}This password has been leaked before it's a bad idea to use it.{bcolors.ENDC}")
            else:
                print(f'{bcolors.OKGREEN}This password has not been leaked before.{bcolors.ENDC}')
        except:
            print(f"{bcolors.FAIL}Can't connect to the internet.{bcolors.ENDC}")
