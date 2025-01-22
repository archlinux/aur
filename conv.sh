#!/bin/bash

# it's a mess. Helpfiles are lowercase .htm and .html, but the internal, relative links have mixed-case names. Thanks Microsoft and Analog.

#This will break if the structure of the helpfiles changes, because parsing html with regex is Evil

# Assumes :
# - links to .css and images don't need to be changed
# - all .htm(l) filenames are lowercase (if not, there is a script in the git log...)

for file in *.htm*; do
	gawk '{
		line = $0;
		filtered_line = ""
		while (match(line, /href="[^"]*/)) {
#append untouched part
			filtered_line = filtered_line substr(line, 1, RSTART - 1)
			matched = substr(line, RSTART, RLENGTH);
# exclude external http/https links and anything other than .htm/.html
			if ((matched !~ /"http/) && (matched ~ /\.html?/)) {
				matched = tolower(matched)
			}
			# append possibly-filtered text
			filtered_line = filtered_line matched

# Continue processing the rest of the line after the matched pattern
		line = substr(line, RSTART + RLENGTH );
		}
#and rescue last unmatched bit if applicable
		filtered_line = filtered_line line

		print filtered_line;
	}' $file > tmp
	mv tmp $file
done

