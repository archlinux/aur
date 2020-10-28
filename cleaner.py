import re
from sys import argv

matcher = re.compile(r'^([0-9A-F]+) ;')

ttf = fontforge.open(argv[1])
for line in open('emoji-data.txt'):
    match = matcher.match(line)
    try:
        if match:
            val = int(match[1], 16)
            ttf.removeGlyph(val)
    except ValueError:
        pass
ttf.generate(argv[1])
