import os
from lxml import etree

doc = etree.parse('/usr/share/X11/xkb/rules/evdev.xml')

layout = doc.xpath('//layout[configItem/name/text()="abnt2ext"]')
if len(layout) > 0:
    layout = layout[0]
    layout.getparent().remove(layout)

layoutlist = doc.xpath('//layoutList')
elm = etree.Element('layout')
elm_configItem = etree.SubElement(elm, 'configItem')
elm_name = etree.SubElement(elm_configItem, 'name')
elm_name.text = 'abnt2ext'
elm_shortDescription = etree.SubElement(elm_configItem, 'shortDescription')
elm_shortDescription.text = 'abnt2-ext'
elm_description = etree.SubElement(elm_configItem, 'description')
elm_description.text = 'ABNT2 Extended'
elm_countryList = etree.SubElement(elm_configItem, 'countryList')
elm_iso3166Id = etree.SubElement(elm_countryList, 'iso3166Id')
elm_iso3166Id.text = 'BR'
elm_languageList = etree.SubElement(elm_configItem, 'languageList')
elm_iso639Id = etree.SubElement(elm_languageList, 'iso639Id')
elm_iso639Id.text = 'por'
elm = etree.ElementTree(elm)

layoutlist[0].append(elm.getroot())


doc.write('/usr/share/X11/xkb/rules/evdev.xml.new', pretty_print=True, xml_declaration=True, encoding='utf-8')

os.rename('/usr/share/X11/xkb/rules/evdev.xml', '/usr/share/X11/xkb/rules/evdev.xml.old')
os.rename('/usr/share/X11/xkb/rules/evdev.xml.new', '/usr/share/X11/xkb/rules/evdev.xml')
