from json import load
from sys import argv

otf = fontforge.open(argv[1])
for emoji in load(open('emoji.json')):
    try:
        if(emoji['non_qualified'] is not None):
            otf.removeGlyph(int(emoji['non_qualified'], 16))
        else:
            otf.removeGlyph(int(emoji['unified'], 16))
    except ValueError:
        pass
otf.generate(argv[1])
