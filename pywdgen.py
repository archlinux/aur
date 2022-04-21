#! /usr/bin/python
# pywdgen - A simple readable password generator, written in Python
# Copyright (C) 2022  Simon Williams

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import sys, getopt, random, string, array, string
import argparse

VERSION = "1.0"
DATE = "21/04/22"

def main(argv):
    previous_letter = 0       #0 = vowel, 1 = consonant
    first_letter = 0          #0 = random, 1 = consonant, 2 = vowel
    consonants = array.array('u',['b','c','d','f','g','h','j','k','l','k','n','m','p','q','r','s','t','y','w','x','z'])
    vowels = array.array('u',['a','e','i','o','u'])
    symbols = array.array('u',['!','?','.',',','+','-','_'])
    
    #Parse arguments
    parser = argparse.ArgumentParser(
        description="A simple readable password generator, Version " + VERSION ,
        epilog="Simon Williams " + DATE)
    parser.add_argument("-l", "--length",help="Length of generated passwords.",default=12,type=int)
    parser.add_argument("-n", "--number",help="Number of passwords to generate.",default=10,type=int)
    parser.add_argument("-d", "--digits",help="Number of digits to include.",default=2,type=int)
    parser.add_argument("-s", "--symbol",help="Include a symbol.",action='store_true')
    parser.add_argument("-c", "--consonant",help="Always start with a consonant.",action='store_true')
    parser.add_argument("-v", "--vowel",help="Always start with a vowel.",action='store_true')
    
    args = parser.parse_args()
            
    if(args.consonant):
        first_letter = 1
    elif(args.vowel):
        first_letter = 2
     
    word_length = args.length - args.digits
    
    for x in range(args.number):
        output = ""
        
        if first_letter == 0:
            previous_letter = random.randint(0,1)
        elif first_letter == 1:
            previous_letter = 0
        elif first_letter == 2:
            previous_letter = 1
            
        for y in range(word_length):
            if previous_letter == 0:
                l = consonants[random.randint(0,len(consonants)-1)]
                previous_letter = 1
            elif previous_letter == 1:
                l = vowels[random.randint(0,len(vowels)-1)]
                previous_letter = 0

            if y == 0 or y == int(word_length/2):
                l = str.upper(l)

            output += l
        
        if(args.symbol):
            output += symbols[random.randint(0,len(symbols)-1)]

        for y in range(args.digits):
            output += str(random.randint(0,9))      
        
        print(output)
    
if __name__ == "__main__":
    main(sys.argv[1:])
