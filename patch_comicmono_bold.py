"""Modify Comic Mono Bold metadata into a Medium variant."""
import fontforge

font = fontforge.open('./ComicMono-Bold.ttf')

font.fontname = 'ComicMono-Medium'
font.fullname = 'Comic Mono Medium'
font.weight = 'Medium'
font.os2_weight = 500

# Exclude UniqueID so FontForge generates an appropriate one for the new font.
font.sfnt_names = [
    name for name in font.sfnt_names
    if name[1] != 'UniqueID'
]

font.generate('./ComicMono-Medium.ttf')
font.close()
