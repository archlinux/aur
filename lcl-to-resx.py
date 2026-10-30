"""Writes .resx files from the LocStudio translations (.lcl) of Microsoft's internal localization.

The official builds apply loc/lcl/<language>/<assembly>.lcl to the built assemblies. This writes the
translations next to the source .resx files instead (Strings.resx -> Strings.de.resx), so the .NET SDK
builds the satellite assemblies.

Usage: lcl-to-resx.py <loc/lcl directory> <assembly name> <project directory>
"""

import pathlib
import sys
import xml.etree.ElementTree as ET

LCX = "{http://schemas.microsoft.com/locstudio/2006/6/lcx}"

# Satellite assembly cultures of the official packages for the target cultures of the .lcl files
CULTURES = {"zh-CN": "zh-Hans", "zh-TW": "zh-Hant", "pt-BR": "pt-BR"}

RESX_HEADER = """<?xml version="1.0" encoding="utf-8"?>
<root>
  <resheader name="resmimetype"><value>text/microsoft-resx</value></resheader>
  <resheader name="version"><value>2.0</value></resheader>
  <resheader name="reader"><value>System.Resources.ResXResourceReader, System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value></resheader>
  <resheader name="writer"><value>System.Resources.ResXResourceWriter, System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value></resheader>
"""


def culture(lcx):
    target = lcx.get("TgtCul")
    return CULTURES.get(target, target.split("-")[0])


def translations(resource):
    """Yields the names and translated values of the strings of a resource item."""
    for item in resource.iter(f"{LCX}Item"):
        value = item.find(f"{LCX}Str/{LCX}Tgt/{LCX}Val")
        if value is not None and item.get("Leaf") == "true":
            yield item.get("ItemId").lstrip(";"), value.text or ""


def find_resx(project, name):
    matches = list(project.rglob(f"{name}.resx"))
    if len(matches) != 1:
        sys.exit(f"Expected one {name}.resx, found {len(matches)}")
    return matches[0]


def main():
    lcl_dir = pathlib.Path(sys.argv[1])
    assembly = sys.argv[2]
    project = pathlib.Path(sys.argv[3])
    for lcl in sorted(lcl_dir.glob(f"*/{assembly}.dll.lcl")):
        lcx = ET.parse(lcl).getroot()
        # The resources are items named after their manifest resource name, containing an item named
        # after the .resx file that has the strings
        for manifest in lcx.findall(f"{LCX}Item"):
            if not manifest.get("ItemId").endswith(".resources"):
                continue
            for resource in manifest.findall(f"{LCX}Item"):
                name = resource.get("ItemId").lstrip(";")
                strings = list(translations(resource))
                if not strings:
                    continue
                resx = find_resx(project, name)
                target = resx.with_name(f"{name}.{culture(lcx)}.resx")
                with target.open("w", encoding="utf-8") as file:
                    file.write(RESX_HEADER)
                    for key, value in strings:
                        data = ET.Element(
                            "data", name=key, attrib={"xml:space": "preserve"}
                        )
                        ET.SubElement(data, "value").text = value
                        file.write("  " + ET.tostring(data, encoding="unicode") + "\n")
                    file.write("</root>\n")


if __name__ == "__main__":
    main()
