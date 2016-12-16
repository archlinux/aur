from json import load
from sys import argv

ttf = fontforge.open(argv[1])
for emoji in load(open('emoji.json')):
    try:
        ttf.removeGlyph(int(emoji['unified'], 16))
    except ValueError:
        pass
ttf.generate(argv[1])
