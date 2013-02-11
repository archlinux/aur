''' Convert CamelCase links in a vimwiki to enclosing with double square
bracket format.  Errs on the safe side by only converting CamelCase words that
have a corresponding file. 

Be very careful running this script.  Make a backup of your wiki before running
it.  Run this on a copy of your wiki and then check you are happy with the
conversions.  Carefully check the files and links that will be converted.

Usage:
    python convert_links.py wiki_directory

Bugs:
* TODO CamelCase links already wrapped in [[ will have additional [[ added
* All instances of filenames will be converted in some cases this might be incorrect

License: GPL3
Author: Julian Ryde

'''

import sys
import os

def is_camelcase(s):
    # works quite well but Camelcase returns true
    return (s != s.lower()) and (s != s.upper())


wiki_ext = '.wiki'
basedir = sys.argv[1] # base directory of the wiki
#outputdir = sys.argv[2]

# generate dictionary of file names

wiki_files = os.listdir(basedir)

# select .wiki files
wiki_files = [wiki_file[:-5] for wiki_file in wiki_files if wiki_file.endswith(wiki_ext)]
wiki_files.sort()
# remove ones that are not CamelCase better to be safe and change minimally
wiki_links = [wiki_file for wiki_file in wiki_files if is_camelcase(wiki_file)]

print '\nWiki files to be altered in', basedir
print wiki_files

print '\nLinks to be converted within these files'
print wiki_links

res = raw_input("\nIf you are happy with these changes press enter to continue.")


# turn into set for fast membership query
wiki_links = set(wiki_links)


# for each wiki file find all instances of members of wiki_files in the file
# contents and replace 
for wiki_file in wiki_files:
    fname = os.path.join(basedir, wiki_file + wiki_ext)
    contents = open(fname).read()
    # replace each wiki_link with the new form for this file
    for wiki_link in wiki_links:
        contents = contents.replace(wiki_link, '[[' + wiki_link + ']]')
    # save modified contents
    #print 'Saving', fname
    open(fname, 'w').write(contents)
