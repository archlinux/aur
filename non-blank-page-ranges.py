#! /usr/bin/python3
"""Read text input and print non-blank page ranges
(pages should be separated by ^L pagebreaks)"""

import sys

# find non-blank pages
page = 1
blank = True
nonblanks = []
for line in sys.stdin:
  for char in line:
    if char == "\x0c": # ^L, pagebreak
      if not blank:
        nonblanks.append(page)
      # new page
      page += 1
      blank = True
    else:
      blank = False

# exit if no non-blank pages found
if not nonblanks:
  exit(1)

# print ranges of non-blank pages in format used by pdftk
# (e.g. "1-3 5-8 10-10")
ranges = []
nonblanks = sorted(nonblanks)
first_in_range = 0

for i in range(1, len(nonblanks)):
  # if the page increased by more than 1 (i.e. at least one
  # page got skipped), append the current range and start a
  # new one
  if nonblanks[i] > nonblanks[i-1] + 1:
    ranges.append("{}-{}".format(nonblanks[first_in_range],
                                 nonblanks[i-1]))
    first_in_range = i

# append the last range
ranges.append("{}-{}".format(nonblanks[first_in_range],
                             nonblanks[-1]))
print(" ".join(ranges)) 
