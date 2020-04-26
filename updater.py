import re
import os
import pexpect
from pyutil import filereplace
from dotenv import load_dotenv
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def read_file():
    pkgbuild = open("./PKGBUILD", "w+")
    print(pkgbuild.read())


# Configure chrome webdriver options
def configure_chrome_webdriver():
    options = Options()
    options.add_argument("--headless")  # Runs Chrome in headless mode.
    options.add_argument('--no-sandbox')  # # Bypass OS security model
    options.add_argument('start-maximized')
    options.add_argument('disable-infobars')
    options.add_argument("--disable-extensions")
    return options


# Connects to website and scrapes latest screen-desktop version
def get_remote_version():
    options = configure_chrome_webdriver()
    driver = webdriver.Chrome(options=options)
    driver.get("https://screen.so/#/download")
    elem = driver.find_element_by_css_selector("p[class='version']").text
    assert "No results found." not in driver.page_source
    version = re.search(r'\d.*', elem).group(0)
    driver.close()
    return version


# Opens PKGBUILD file, and searhces for the version number
def get_local_version():
    myfile = open("./PKGBUILD", "rt")  # open lorem.txt for reading text
    pkgbuild = myfile.read()  # read the entire file into a string
    myfile.close()
    version = re.search(r'pkgver=(\d.*)', pkgbuild).group(1)
    return version


# Check wheather the download file has changed
# We will need to check the source
# with the actual package (Which we have in the pkgbuild file)
def check_updated(remote_version, local_version):
    updated = False
    if local_version != remote_version:
        updated = True
    return updated


# Updates the pkgbuild if the screen-desktop file has changed from source
#1. Modify the PKGBUILD to fit the new version
#    * `nvim PKGBUILD`
#2. calculate the new hash
#    * `makepkg -g`
#3. Modify the PKGBUILD to include the new md5sum
#    * `nvim PKGBUILD`
#4. Update the .SRCINFO file
#    * `makepkg --printsrcinfo > .SRCINFO`
#5. Commit and push
#    * `gaa & gca -m "Message" & ggpush`
#6. Clean resulting workspace
def update_pkgbuild(remote_version, local_version):
    filereplace("./PKGBUILD", local_version, remote_version)
    child = pexpect.spawnu('makepkg -g')
    child.expect(r'md5sums=\(\'([a-fA-F\d]*)\'\)')
    file_hash = child.match.group(0)
    filereplace('./PKGBUILD', r'md5sums=\(\'([a-fA-F\d]*)\'\)', file_hash)
    child = pexpect.spawn('/bin/bash -c "makepkg --printsrcinfo > .SRCINFO"')
    child.expect(pexpect.EOF)
    child = pexpect.spawnu('git add .SRCINFO PKGBUILD')
    child.expect(pexpect.EOF)
    child = pexpect.spawnu(
        'git commit -m "Updated screen-desktop to version {remote_version}"'.
        format(remote_version=remote_version))
    child.expect(pexpect.EOF)
    child = pexpect.spawnu('git push origin master')
    child.expect(r'Enter passphrase for key .*')
    child.sendline(os.getenv("PW"))
    child.expect(pexpect.EOF)


def main():
    load_dotenv()
    configure_chrome_webdriver()
    local_version = get_local_version()
    remote_version = get_remote_version()
    if check_updated(remote_version, local_version):
        update_pkgbuild(remote_version, local_version)


if __name__ == "__main__":
    main()
