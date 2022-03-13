import os
import sys
import glob
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


def wait_downloading():
    timeout_start = 60
    timeout_download = 60*5
    for wait_start in range(timeout_start-1):
        if len(glob.glob(f'{os.getcwd()}/*.part')) > 0:
            for wait_download in range(timeout_download-1):
                tmpfiles = glob.glob(f'{os.getcwd()}/*.part')
                if len(tmpfiles) > 0:
                    filesize = os.path.getsize(tmpfiles[0])
                    message(f"Downloading file: {humansize(filesize)}")
                else:
                    print("Loading is complete")
                    return
                sleep(1)
            else:
                if wait_download >= timeout_download:
                    print("Download interrupted by timeout")
                return
        sleep(1)

    if wait_start >= timeout_start:
        print("Waiting for download interrupted by timeout")


options = webdriver.FirefoxOptions()
options.headless = True
options.set_preference("browser.download.folderList", 2)
options.set_preference("browser.download.manager.showWhenStarting", False)
options.set_preference("browser.download.dir", os.getcwd())
options.set_preference(
    "browser.helperApps.neverAsk.saveToDisk", "application/octet-stream")

browser = webdriver.Firefox(options=options)
browser.implicitly_wait(60)

browser.get(
    'https://supportportal.gemalto.com/csm?id=kb_article_view&sysparm_article=KB0018315#')
browser.find_element(By.LINK_TEXT, "DOW0003342").click()
sleep(10)
browser.find_element(By.CSS_SELECTOR, ".btn-success").click()

wait_downloading()

browser.quit()
