import re
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
def check_updated():
    updated = False
    remote_version = get_remote_version()
    local_version = get_local_version()
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
def update_pkgbuild():
    print("todo")


def main():
    configure_chrome_webdriver()
    if check_updated():
        update_pkgbuild()


if __name__ == "__main__":
    main()
