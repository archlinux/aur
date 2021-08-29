#!/usr/bin/python

import random
import textwrap

ascii_dove = """                                                                      
             \                                                                          
              \                                                                         
               \                                                    O,                  
                \                                                   o.'                 
                 \                                                 0, l,                
                  \                                                l,  o'               
                   \                 O                            ;,    :,              
                    \                'loo                         ;c     ,c             
                     \               ;d  olo                     c;       ,;            
                      \              l;0   Oold                 l;        'd            
                       \             O;       dl               d;          c            
                        \             :l       0lo            d:           :            
                         \            o:          d          d:            c            
                          \           d:           d        lc             l            
                           \           c            O     0co             ,d            
                            \         Oc            O0    c               ;             
                             \        0l             d  oo               :o             
                              \      ;o             0 l;                 ;              
                                  ;000             Ool                  :;              
                                0O   OO o ,     0 dd0                  c,               
                               OO -O-    0OOO:-/ O                    lO                
                             <do;   ,0_                            ,dd                  
                                O   0  ;0                       ;00                     
                                 0 O'    dO                   0m                        
                                  0;       d                    -0000O0M^;              
                                             d 0;                        l              
                                              0  ;;0                    o               
                                                    ;00OO;,,0000l;     d                
                                                                  l0; d                 
                                                                    '0                  
                                                                          """

if __name__ == '__main__':
    # Read verse file
    try:
        verses_file = open("verses.txt")
    except FileNotFoundError:
        verses_file = open("/usr/share/biblesay/verses.txt")

    verses = verses_file.readlines();

    # Choose a verse
    verse = verses[random.randint(0, len(verses) - 1)]

    # Wrap the text
    verse = textwrap.wrap(verse, width=50)

    # This int is for generating the speech bubble around the text later
    longest_line = 0

    # Get the longest line
    for i in range(len(verse)):
        if len(verse[i]) > longest_line:
            longest_line = len(verse[i])

    # Print the top speech bubble line
    print('/', end='');
    for i in range(longest_line + 2): 
        print('‾', end='');
    print('\\', end='\n');

    # Print the lines with vertical lines
    for i in range(len(verse)):
        for j in range(len(verse[i]), longest_line + 1):
            verse[i] += ' '
        verse[i] += '|'
        verse[i] = '| ' + verse[i]
        print(verse[i])

    # Print the bottom speech bubble line
    print('\\', end='');
    for i in range(longest_line + 2): 
        print('_', end='');
    print('/', end='');

    # Print the dove
    print(ascii_dove)
