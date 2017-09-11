#!/usr/bin/python

# Copyright (C) 2017 Marco Scarpetta
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from urllib import request
from html.parser import HTMLParser
import os
import subprocess

lang = "it"
local_arch = "x86_64"

class FirefoxDeveloperVersionExtractor(HTMLParser):
    td_count = 0
    ok_a_tag = False
    ok_data = False
    version = ""
    version_number = 0
    beta_number = 0
    
    def handle_starttag(self, tag, attrs):
        if tag == "tr":
            self.td_count = 0
        elif tag == "td":
            self.td_count += 1
            if self.td_count == 2:
                self.ok_a_tag = True
        elif tag == "a" and self.ok_a_tag:
            self.ok_a_tag = False
            self.ok_data = True

    def handle_data(self, data):
        if self.ok_data:
            self.ok_data = False
            version = data[0:-1]
            try:
                version_split = version.split("b")
                version_number = float(version_split[0])
                beta_number = int(version_split[1])
                if version_number > self.version_number or (version_number == self.version_number and beta_number > self.beta_number):
                    self.version_number = version_number
                    self.beta_number = beta_number
                    self.version = version
            except:
                pass

#get current version
old_version = ""
pkgrel = ""
pkgbuild = open("PKGBUILD")
line = pkgbuild.readline()
while len(line) > 0:
    if line.startswith("pkgver"):
        old_version = line.replace("pkgver=","").replace("\n", "")
    elif line.startswith("pkgrel"):
        pkgrel = line.replace("pkgrel=","").replace("\n", "")
    line = pkgbuild.readline()
    
print("Current version: {}\n".format(old_version))

#check for new versions
print("Checking for new versions...\n")
f = request.urlopen("https://ftp.mozilla.org/pub/devedition/releases/")

parser = FirefoxDeveloperVersionExtractor()
parser.feed(str(f.read()))

if old_version == parser.version:
    print("No new versions available\n")
    exit(0)

print("New version available: {}\n".format(parser.version))

#download new version files
print("Downloading new version...\n")
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/linux-i686/{1}/firefox-{0}.tar.bz2 > firefox-i686-{0}.tar.bz2".format(parser.version, lang))
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/linux-x86_64/{1}/firefox-{0}.tar.bz2 > firefox-x86_64-{0}.tar.bz2".format(parser.version, lang))
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/SHA512SUMS.asc > SHA512SUMS.asc".format(parser.version))
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/SHA512SUMS > SHA512SUMS".format(parser.version))

#check SHA512SUMS file's signature
print("\nChecking SHA512SUMS file's signature...\n")
subprocess.run(["gpg", "--verify", "SHA512SUMS.asc"], check=True)

#check SHA512SUM
print("\nChecking SHA512SUM...\n")
#calculate SHA512SUM
sha512sum_i686 = str(subprocess.run(["sha512sum", "firefox-i686-{0}.tar.bz2".format(parser.version)], stdout=subprocess.PIPE).stdout, encoding='utf-8').split(" ")[0]
sha512sum_x86_64 = str(subprocess.run(["sha512sum", "firefox-x86_64-{0}.tar.bz2".format(parser.version)], stdout=subprocess.PIPE).stdout, encoding='utf-8').split(" ")[0]

#compare SHA512SUMs of downloaded files with those in SHA512SUMS file
sha512sum_i686_ok = False
sha512sum_x86_64_ok = False
sha512sum_file = open("SHA512SUMS")
line = sha512sum_file.readline()
while len(line) > 0:
    if line.count(" linux-i686/{0}/firefox-{1}.tar.bz2".format(lang, parser.version)) > 0:
        if line.split(" ")[0] == sha512sum_i686:
            sha512sum_i686_ok = True
    if line.count(" linux-x86_64/{0}/firefox-{1}.tar.bz2".format(lang, parser.version)) > 0:
        if line.split(" ")[0] == sha512sum_x86_64:
            sha512sum_x86_64_ok = True
    line = sha512sum_file.readline()

if not sha512sum_i686_ok or not sha512sum_x86_64_ok:
    exit(1)

#update PKGBUILD
print("Updating PKGBUILD...\n")
buf = ""
pkgbuild = open("PKGBUILD")
line = pkgbuild.readline()
while len(line) > 0:
    if line.startswith("pkgver="):
        buf += "pkgver={}\n".format(parser.version)
    elif line.startswith("sha512sums_i686="):
        buf += "sha512sums_i686=('{}')\n".format(sha512sum_i686)
    elif line.startswith("sha512sums_x86_64="):
        buf += "sha512sums_x86_64=('{}')\n".format(sha512sum_x86_64)
    else:
        buf += line
    line = pkgbuild.readline()
pkgbuild.close()

pkgbuild = open("PKGBUILD", "w")
pkgbuild.write(buf)
pkgbuild.close()

#rename source file
subprocess.run(["mv", "firefox-{0}-{1}.tar.bz2".format(local_arch, parser.version), "firefox-{0}.tar.bz2".format(parser.version)], check=True)

#build package
print("Building package...\n")
subprocess.run(["makepkg"], check=True)

#install package
print("Installing package...\n")
subprocess.run(["sudo", "pacman", "-U", "firefox-developer-{}-{}-{}-{}.pkg.tar.xz".format(lang, parser.version, pkgrel, local_arch)], check=True)

#update .SRCINFO
print("Updating .SRCINFO...\n")
os.system("makepkg --printsrcinfo > .SRCINFO")

#commit changes
print("Commiting changes...\n")

os.system("git add PKGBUILD .SRCINFO")
os.system("git commit -m 'Automatic upgrade to version {}.'".format(parser.version))
os.system("git push origin master")

#clean big source files and built package
subprocess.run(["rm", "firefox-{0}-{1}.tar.bz2".format("i686" if local_arch == "x86_64" else "x86_64", parser.version), "firefox-{0}.tar.bz2".format(parser.version)], check=True)
subprocess.run(["rm", "firefox-developer-{}-{}-{}-{}.pkg.tar.xz".format(lang, parser.version, pkgrel, local_arch)], check=True)

print("DONE")
