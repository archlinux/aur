#!/usr/bin/python
# This file is used to update the version number
# The SemVer (https://semver.org) versioning system is used.
import re
import sys

pkgbuild_path = "./PKGBUILD"

with open(pkgbuild_path, "r") as main_go:
    content = main_go.read()
    old_version = content.split("pkgver=")[1].split("\n")[0]
    print(f"Found old version in {pkgbuild_path}: {old_version}")

# Get the second command-line argument
if len(sys.argv) != 2:
    print("Exactly one argument (new semver-version) is required but {} were given.".format(len(sys.argv)-1))
    quit(1)
else:
    VERSION = sys.argv[1]

if not re.match(r"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$", VERSION):
    print(
        f"\x1b[31mThe version: '{VERSION}' is not a valid SemVer version.\x1b[0m")
    quit()

with open(pkgbuild_path, "w") as main_go:
    main_go.write(content.replace(old_version, VERSION))

print(f"Version has been changed from '{old_version}' -> '{VERSION}'")
