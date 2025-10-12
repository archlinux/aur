import dataclasses
import os

from fontTools.ttLib import TTFont
from fontTools.ttLib.tables._n_a_m_e import makeName, table__n_a_m_e


@dataclasses.dataclass
class FontUpdateInfo:
    otf: str
    mac_name: str
    mac_style: str
    win_name: str

    def add_compat_names(self):
        font = TTFont(self.otf)
        font_tab: table__n_a_m_e = font["name"]
        font_tab.names.append(makeName(string=self.mac_name, nameID=1, platformID=1, platEncID=0, langID=0))
        font_tab.names.append(makeName(string=self.mac_style, nameID=2, platformID=1, platEncID=0, langID=0))
        font_tab.names.append(makeName(string=self.win_name, nameID=1, platformID=3, platEncID=1, langID=0x0409))
        font.save(f'{self.otf}_.otf')
        os.rename(f'{self.otf}_.otf', self.otf)


fonts_update_info = [
    FontUpdateInfo('lmmono10-italic.otf', 'Latin Modern Mono', '10 Italic', 'LM Mono 10'),
    FontUpdateInfo('lmmono10-regular.otf', 'Latin Modern Mono', '10 Regular', 'LM Mono 10'),
    FontUpdateInfo('lmmono12-regular.otf', 'Latin Modern Mono', '12 Regular', 'LM Mono 12'),
    FontUpdateInfo('lmmono8-regular.otf', 'Latin Modern Mono', '8 Regular', 'LM Mono 8'),
    FontUpdateInfo('lmmono9-regular.otf', 'Latin Modern Mono', '9 Regular', 'LM Mono 9'),
    FontUpdateInfo('lmmonocaps10-oblique.otf', 'Latin Modern Mono Caps', '10 Oblique', 'LM Mono Caps 10'),
    FontUpdateInfo('lmmonocaps10-regular.otf', 'Latin Modern Mono Caps', '10 Regular', 'LM Mono Caps 10'),
    FontUpdateInfo('lmmonolt10-bold.otf', 'Latin Modern Mono Light', '10 Bold', 'LM Mono Light 10'),
    FontUpdateInfo('lmmonolt10-boldoblique.otf', 'Latin Modern Mono Light', '10 Bold Oblique', 'LM Mono Light 10'),
    FontUpdateInfo('lmmonolt10-oblique.otf', 'Latin Modern Mono Light', '10 Oblique', 'LM Mono Light 10'),
    FontUpdateInfo('lmmonolt10-regular.otf', 'Latin Modern Mono Light', '10 Regular', 'LM Mono Light 10'),
    FontUpdateInfo('lmmonoltcond10-oblique.otf', 'Latin Modern Mono Light Cond', '10 Oblique', 'LM Mono Light Cond 10'),
    FontUpdateInfo('lmmonoltcond10-regular.otf', 'Latin Modern Mono Light Cond', '10 Regular', 'LM Mono Light Cond 10'),
    FontUpdateInfo('lmmonoprop10-oblique.otf', 'Latin Modern Mono Prop', '10 Oblique', 'LM Mono Prop 10'),
    FontUpdateInfo('lmmonoprop10-regular.otf', 'Latin Modern Mono Prop', '10 Regular', 'LM Mono Prop 10'),
    FontUpdateInfo('lmmonoproplt10-bold.otf', 'Latin Modern Mono Prop Light', '10 Bold', 'LM Mono Prop Light 10'),
    FontUpdateInfo('lmmonoproplt10-boldoblique.otf', 'Latin Modern Mono Prop Light', '10 BoldOblique',
                   'LM Mono Prop Light 10'),
    FontUpdateInfo('lmmonoproplt10-oblique.otf', 'Latin Modern Mono Prop Light', '10 Oblique', 'LM Mono Prop Light 10'),
    FontUpdateInfo('lmmonoproplt10-regular.otf', 'Latin Modern Mono Prop Light', '10 Regular', 'LM Mono Prop Light 10'),
    FontUpdateInfo('lmmonoslant10-regular.otf', 'Latin Modern Mono Slanted', '10 Regular', 'LM Mono Slanted 10'),
    FontUpdateInfo('lmroman10-bold.otf', 'Latin Modern Roman', '10 Bold', 'LM Roman 10'),
    FontUpdateInfo('lmroman10-bolditalic.otf', 'Latin Modern Roman', '10 Bold Italic', 'LM Roman 10'),
    FontUpdateInfo('lmroman10-italic.otf', 'Latin Modern Roman', '10 Italic', 'LM Roman 10'),
    FontUpdateInfo('lmroman10-regular.otf', 'Latin Modern Roman', '10 Regular', 'LM Roman 10'),
    FontUpdateInfo('lmroman12-bold.otf', 'Latin Modern Roman', '12 Bold', 'LM Roman 12'),
    FontUpdateInfo('lmroman12-italic.otf', 'Latin Modern Roman', '12 Italic', 'LM Roman 12'),
    FontUpdateInfo('lmroman12-regular.otf', 'Latin Modern Roman', '12 Regular', 'LM Roman 12'),
    FontUpdateInfo('lmroman17-regular.otf', 'Latin Modern Roman', '17 Regular', 'LM Roman 17'),
    FontUpdateInfo('lmroman5-bold.otf', 'Latin Modern Roman', '5 Bold', 'LM Roman 5'),
    FontUpdateInfo('lmroman5-regular.otf', 'Latin Modern Roman', '5 Regular', 'LM Roman 5'),
    FontUpdateInfo('lmroman6-bold.otf', 'Latin Modern Roman', '6 Bold', 'LM Roman 6'),
    FontUpdateInfo('lmroman6-regular.otf', 'Latin Modern Roman', '6 Regular', 'LM Roman 6'),
    FontUpdateInfo('lmroman7-bold.otf', 'Latin Modern Roman', '7 Bold', 'LM Roman 7'),
    FontUpdateInfo('lmroman7-italic.otf', 'Latin Modern Roman', '7 Italic', 'LM Roman 7'),
    FontUpdateInfo('lmroman7-regular.otf', 'Latin Modern Roman', '7 Regular', 'LM Roman 7'),
    FontUpdateInfo('lmroman8-bold.otf', 'Latin Modern Roman', '8 Bold', 'LM Roman 8'),
    FontUpdateInfo('lmroman8-italic.otf', 'Latin Modern Roman', '8 Italic', 'LM Roman 8'),
    FontUpdateInfo('lmroman8-regular.otf', 'Latin Modern Roman', '8 Regular', 'LM Roman 8'),
    FontUpdateInfo('lmroman9-bold.otf', 'Latin Modern Roman', '9 Bold', 'LM Roman 9'),
    FontUpdateInfo('lmroman9-italic.otf', 'Latin Modern Roman', '9 Italic', 'LM Roman 9'),
    FontUpdateInfo('lmroman9-regular.otf', 'Latin Modern Roman', '9 Regular', 'LM Roman 9'),
    FontUpdateInfo('lmromancaps10-oblique.otf', 'Latin Modern Roman Caps', '10 Oblique', 'LM Roman Caps 10'),
    FontUpdateInfo('lmromancaps10-regular.otf', 'Latin Modern Roman Caps', '10 Regular', 'LM Roman Caps 10'),
    FontUpdateInfo('lmromandemi10-oblique.otf', 'Latin Modern Roman Demi', '10 Oblique', 'LM Roman Demi 10'),
    FontUpdateInfo('lmromandemi10-regular.otf', 'Latin Modern Roman Demi', '10 Regular', 'LM Roman Demi 10'),
    FontUpdateInfo('lmromandunh10-oblique.otf', 'Latin Modern Roman Dunhill', '10 Oblique', 'LM Roman Dunhill 10'),
    FontUpdateInfo('lmromandunh10-regular.otf', 'Latin Modern Roman Dunhill', '10 Regular', 'LM Roman Dunhill 10'),
    FontUpdateInfo('lmromanslant10-bold.otf', 'Latin Modern Roman Slanted', '10 Bold', 'LM Roman Slanted 10'),
    FontUpdateInfo('lmromanslant10-regular.otf', 'Latin Modern Roman Slanted', '10 Regular', 'LM Roman Slanted 10'),
    FontUpdateInfo('lmromanslant12-regular.otf', 'Latin Modern Roman Slanted', '12 Regular', 'LM Roman Slanted 12'),
    FontUpdateInfo('lmromanslant8-regular.otf', 'Latin Modern Roman Slanted', '8 Regular', 'LM Roman Slanted 8'),
    FontUpdateInfo('lmromanslant9-regular.otf', 'Latin Modern Roman Slanted', '9 Regular', 'LM Roman Slanted 9'),
    FontUpdateInfo('lmromanunsl10-regular.otf', 'Latin Modern Roman Unslanted', '10 Regular', 'LM Roman Unslanted 10'),
    FontUpdateInfo('lmsans10-bold.otf', 'Latin Modern Sans', '10 Bold', 'LM Sans 10'),
    FontUpdateInfo('lmsans10-boldoblique.otf', 'Latin Modern Sans', '10 Bold Oblique', 'LM Sans 10'),
    FontUpdateInfo('lmsans10-oblique.otf', 'Latin Modern Sans', '10 Oblique', 'LM Sans 10'),
    FontUpdateInfo('lmsans10-regular.otf', 'Latin Modern Sans', '10 Regular', 'LM Sans 10'),
    FontUpdateInfo('lmsans12-oblique.otf', 'Latin Modern Sans', '12 Oblique', 'LM Sans 12'),
    FontUpdateInfo('lmsans12-regular.otf', 'Latin Modern Sans', '12 Regular', 'LM Sans 12'),
    FontUpdateInfo('lmsans17-oblique.otf', 'Latin Modern Sans', '17 Oblique', 'LM Sans 17'),
    FontUpdateInfo('lmsans17-regular.otf', 'Latin Modern Sans', '17 Regular', 'LM Sans 17'),
    FontUpdateInfo('lmsans8-oblique.otf', 'Latin Modern Sans', '8 Oblique', 'LM Sans 8'),
    FontUpdateInfo('lmsans8-regular.otf', 'Latin Modern Sans', '8 Regular', 'LM Sans 8'),
    FontUpdateInfo('lmsans9-oblique.otf', 'Latin Modern Sans', '9 Oblique', 'LM Sans 9'),
    FontUpdateInfo('lmsans9-regular.otf', 'Latin Modern Sans', '9 Regular', 'LM Sans 9'),
    FontUpdateInfo('lmsansdemicond10-oblique.otf', 'Latin Modern Sans Demi Cond', '10 Oblique', 'LM Sans Demi Cond 10'),
    FontUpdateInfo('lmsansdemicond10-regular.otf', 'Latin Modern Sans Demi Cond', '10 Regular', 'LM Sans Demi Cond 10'),
    FontUpdateInfo('lmsansquot8-bold.otf', 'Latin Modern Sans Quotation', '8 Bold', 'LM Sans Quot 8'),
    FontUpdateInfo('lmsansquot8-boldoblique.otf', 'Latin Modern Sans Quotation', '8 Bold Oblique', 'LM Sans Quot 8'),
    FontUpdateInfo('lmsansquot8-oblique.otf', 'Latin Modern Sans Quotation', '8 Oblique', 'LM Sans Quot 8'),
    FontUpdateInfo('lmsansquot8-regular.otf', 'Latin Modern Sans Quotation', '8 Regular', 'LM Sans Quot 8')
]

for font_up_info in fonts_update_info:
    font_up_info.add_compat_names()
