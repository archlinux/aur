#!/usr/bin/env python3

# Fixes a bunch of inconsistencies and wrong properties in MonacoB fonts.

import os
import shutil
import sys

import fontforge

print("=== MonacoB font patcher ===")

def usage():
    sys.exit(f"Usage: {sys.argv[0]} [--output-dir <dir>] <font file, ...>")

argc = len(sys.argv)

if argc < 2:
    usage()

output_dir = None

if sys.argv[1] == "--output-dir":
    if argc < 3:
        usage()
    output_dir = sys.argv[2]

    if not os.path.isdir(output_dir):
        sys.exit(f"Error: Output directory '{output_dir}' does not exist.")

    output_dir = os.path.realpath(output_dir)
    fonts_list = sys.argv[3:]
else:
    fonts_list = sys.argv[1:]

total = len(fonts_list)

if total == 0:
    usage()

for i, font_file in enumerate(fonts_list):
    print(f"\n=== Patching font #{i + 1} of #{total} ===")

    try:
        file_full_path = os.path.realpath(font_file)
    except OSError:
        print(f"  -> ERROR: Failed to resolve the real path of '{font_file}'.")
        sys.exit(1)

    file_name = os.path.basename(file_full_path)

    print(f"==> Opening font file: '{file_name}'...")

    try:
        font = fontforge.open(file_full_path)
    except:
        print("  -> ERROR: Failed to open font.")
        sys.exit(1)

    font_changed = False

    # Uncomment for debugging.
    # print(f"  -> font.fontname: {font.fontname}") # 'Fontname'
    # print(f"  -> font.familyname: {font.familyname}") # 'Family Name'
    # print(f"  -> font.fullname: {font.fullname}") # 'Name For Humans'
    # print(f"  -> font.weight: {font.weight}") # 'Weight'
    # print(f"  -> font.italicangle: {font.italicangle}") # 'Italic Angle'
    # print(f"  -> font.sfnt_names: {font.sfnt_names}") # 'TTF Names'

    proper_fontname = font.fullname.replace(" ", "-")

    if font.fontname != proper_fontname:
        print(f"  -> Fixing font's `fontname`: '{font.fontname}' -> '{proper_fontname}'")
        font.fontname = proper_fontname
        font_changed = True

    # Try to extract font family and style from font.fontname.
    if "-" in font.fontname:
        font_family, font_style = font.fontname.split("-", 1)
    else:
        font_family = font.fontname
        font_style = "Regular"

    removed_count = 0

    # Iterate over the 'TTF Names' table.
    for lang, strid, string in font.sfnt_names:
        # Remove any row that's not 'English (US)'.
        if lang != "English (US)" or strid.startswith("Preferred"):
            removed_count += 1
            font.appendSFNTName(lang, strid, None)
            font_changed = True
            continue

        # Remove any row that's not either 'Copyright', 'UniqueID' or 'Version'.
        # Ideally, we should be updating 'Family', 'SubFamily' and 'PostScriptName',
        # but for whatever reason, appendSFNTName() does not work when we add values.
        # Fortunately, removing these properties seem to also work in our case, so let's just do that.
        if strid != "Copyright" and strid != "UniqueID" and strid != "Version":
            removed_count += 1
            font.appendSFNTName(lang, strid, None)
            continue

    print(f"  -> Removed a total of {removed_count} rows from SFNT name table.")

    if font_style == "Italic" and font.italicangle >= 0:
        print(f"  -> Fixing font's `italicangle`: '{font.italicangle}' -> '-12.0'")
        font.italicangle = -12.0
        font_changed = True

    if font.familyname != font_family:
        print(f"  -> Fixing font's `familyname`: '{font.familyname}' -> '{font_family}'")
        font.familyname = font_family
        font_changed = True

    file_name_without_ext, file_ext = os.path.splitext(file_name)

    if output_dir:
        new_file_full_path = output_dir + os.sep + proper_fontname + file_ext
    else:
        new_file_full_path = file_full_path

    if font_changed:
        print("  -> Re-generating font...")

        if output_dir:
            print(f"  -> Writing font file '{os.path.basename(new_file_full_path)}' to output directory '{output_dir}'...")
        else:
            print("  -> Overwriting font file...")
        try:
            font.generate(new_file_full_path)
            font.close()
        except:
            print("  -> ERROR: Failed to re-generate font.")
            sys.exit(1)
    elif output_dir and not os.path.isfile(new_file_full_path):
        print(f"  -> Writing font file '{os.path.basename(new_file_full_path)}' to output directory '{output_dir}'...")
        shutil.copy2(file_full_path, new_file_full_path)
    else:
        print("  -> Font does not need to be re-generated/overwritten...")

    print("  -> Done!")
