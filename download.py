import os
import sys
import glob
import re
from pathlib import Path
from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By


def humansize(nbytes):
    suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB']
    i = 0
    while nbytes >= 1024 and i < len(suffixes)-1:
        nbytes /= 1024.
        i += 1
    f = ('%.2f' % nbytes).rstrip('0').rstrip('.')
    return '%s %s' % (f, suffixes[i])


def message(msg):
    bar = "\u2588"
    sys.stdout.write(bar+"\r"+msg)
    # sys.stdout.flush()


_ldk_filename = "Sentinel_LDK_Linux_Run-time_Installer_script.tar.gz"

def wait_downloading():
    timeout_start = 60
    timeout_download = 60*5
    target_path = Path(_ldk_filename)
    
    if not (target_path.exists() and target_path.stat().st_size>0):
        message(f"waiting for download to start {timeout_start} sec.")
        while not list(Path('.').glob('*.part')) and timeout_start:
            sleep(1)
            timeout_start-=1
        
        if not list(Path('.').glob('*.part')):
            raise Exception("Download failed")
        
        while (tmp_files:=list(Path('.').glob('*.part'))) and timeout_download:
            filesize = os.path.getsize(tmp_files[0])
            message(f"Downloading file: {humansize(filesize)} wait {timeout_download} sec.")
            sleep(1)
            timeout_download-=1

        if not (target_path.exists() and target_path.stat().st_size>0):
            raise Exception("Download failed")

    message("Downloading complete\n")


print("Download init..")
options = webdriver.FirefoxOptions()
options.headless = True
options.set_preference("browser.download.folderList", 2)
options.set_preference("browser.download.manager.showWhenStarting", False)
options.set_preference("browser.download.dir", os.getcwd())
options.set_preference(
    "browser.helperApps.neverAsk.saveToDisk", "application/octet-stream")

try:
    browser = webdriver.Firefox(options=options)
    browser.implicitly_wait(60)

    browser.get(
        'https://supportportal.gemalto.com/csm?id=kb_article_view&sysparm_article=KB0018315#')
    browser.find_element(By.LINK_TEXT, "DOW0003342").click()

    browser.find_element(By.CSS_SELECTOR, ".btn-success").click()
    
    wait_downloading()
except:
    exit(1)
finally:
    browser.quit()

os.system(f"tar -xvzf {_ldk_filename}")
for root, dirs, files in os.walk(os.getcwd()):
    for file in files:
        if match:=re.match("aksusbd-(\d+\.\d+)\.(\d+)", file):
            _vers, _rel = match.groups()
            os.system(f'echo "{_vers} {_rel}">version.txt')
            exit(0)
exit(1)