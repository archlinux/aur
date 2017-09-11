#!/usr/bin/python

from urllib import request
from html.parser import HTMLParser
import os
import subprocess

lang = "it"

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
pkgbuild = open("PKGBUILD")
line = pkgbuild.readline()
while len(line) > 0:
    if line.startswith("pkgver"):
        old_version = line.replace("pkgver=","").replace("\n", "")
        break
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

#download new version
print("Downloading new version...\n")
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/linux-x86_64/{1}/firefox-{0}.tar.bz2 > firefox-{0}.tar.bz2".format(parser.version, lang))
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/SHA512SUMS.asc > SHA512SUMS.asc".format(parser.version))
os.system("curl https://ftp.mozilla.org/pub/devedition/releases/{0}/SHA512SUMS > SHA512SUMS".format(parser.version))

#check SHA512SUMS file's signature
print("\nChecking SHA512SUMS file's signature...\n")
subprocess.run(["gpg", "--verify", "SHA512SUMS.asc"], check=True)

#check SHA512SUM
print("\nChecking SHA512SUM...\n")
sha512sum = str(subprocess.run(["sha512sum", "firefox-{0}.tar.bz2".format(parser.version)], stdout=subprocess.PIPE).stdout, encoding='utf-8').split(" ")[0]

sha512sum_ok = False
sha512sum_file = open("SHA512SUMS")
line = sha512sum_file.readline()
while len(line) > 0:
    if line.count(" linux-x86_64/{0}/firefox-{1}.tar.bz2".format(lang, parser.version)) > 0:
        if line.split(" ")[0] == sha512sum:
            sha512sum_ok = True
            break
    line = sha512sum_file.readline()

if not sha512sum_ok:
    exit(1)

#update PKGBUILD
print("Updating PKGBUILD...\n")
buf = ""
pkgbuild = open("PKGBUILD")
line = pkgbuild.readline()
while len(line) > 0:
    if line.startswith("pkgver="):
        buf += "pkgver={}\n".format(parser.version)
    elif line.startswith("sha512sums="):
        buf += "sha512sums=('{}'\n".format(sha512sum)
    else:
        buf += line
    line = pkgbuild.readline()
pkgbuild.close()

pkgbuild = open("PKGBUILD", "w")
pkgbuild.write(buf)
pkgbuild.close()

#build package
print("Building package...\n")
subprocess.run(["makepkg"], check=True)

#update .SRCINFO
print("Updating .SRCINFO...\n")
os.system("makepkg --printsrcinfo > .SRCINFO")

#commit changes
print("Commiting changes...\n")
os.system("git add PKGBUILD .SRCINFO")
os.system("git commit -m 'Automatic upgrade to version {}.'".format(parser.version))
os.system("git push origin master")

print("DONE")
