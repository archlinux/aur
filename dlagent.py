import requests
from bs4 import BeautifulSoup
import sys
import getpass
import progressbar
import locale

if len(sys.argv) != 5:
    print("Error: arguments file_url, target_file, os_number and version_number required.")
    exit(1)

file_url = sys.argv[1]
target_file = sys.argv[2]
os_number = sys.argv[3]
version_number = sys.argv[4]

bar = None
def show_progress(count, block_size, total_size):
    global bar
    if bar is None:
        bar = progressbar.ProgressBar(
            maxval = total_size,
            widgets = [
                progressbar.Percentage(),
                ' ',
                progressbar.Bar(),
                ' ',
                progressbar.FileTransferSpeed(),
                ' | ',
                progressbar.ETA(),
            ])
        bar.start()
    bar.update(min(count * block_size, total_size))

if "www.bricsys.com" in file_url:
    if 'fr' in locale.getlocale()[0]:
        print("Veuillez entrer votre nom d'utilisateur/email Bricsys avec votre mot de passe pour télécharger le fichier source")
    else:
        print("Please provide your Bricsys username/email along with your password to download the source file")
    _username = input("Username or email: ")
    _password = getpass.getpass()

    s = requests.session()
    r = s.get("https://boa.bricsys.com/protected/download.do")
    soup = BeautifulSoup(r.text, 'html.parser')
    _url = soup.find_all("form", attrs={"id":"kc-form-login"})[0]["action"]

    headers = {'User-Agent': 'Mozilla/5.0'}
    payload = {'username':_username, 'password':_password}
    r = s.post(_url, headers=headers, data=payload)
    soup = BeautifulSoup(r.text, 'html.parser')
    try:
        _csrf = soup.find_all("token")[0]["data-token"]
    except IndexError:
        if 'fr' in locale.getlocale()[0]:
            print("Mauvais identifiants Bricsys !")
        else:
            print("Wrong Bricsys credentials !")
        exit(1)

    r = s.get(f"https://boa.bricsys.com/common/GetDownloadInstallsetData.json?i={version_number}&os={os_number}")
    rj = r.json()
    _du = rj['downloadURL']
    _i = rj['installsets'][0]['id']
    _if = rj['installsets'][0]['files'][0]['id']
    _su = rj['installsets'][0]['files'][0]['signedUrl']

    headers = {'User-Agent': 'Mozilla/5.0', 'Referer': 'https://www.bricsys.com/protected/download.do'}
    payload = {'_csrf':_csrf, 'i':_i, 'if':_if, 'accept': 'true', 'signedUrl': _su}

    with open(target_file, "wb") as f:
        r = s.post("https://boa.bricsys.com/protected/download.do", headers=headers, data=payload, stream=True)
        total_length = r.headers.get('content-length')

        if total_length is None: # no content length header
            f.write(r.content)
        else:
            dl = 0
            total_length = int(total_length)
            for data in r.iter_content(chunk_size=4096):
                dl += len(data)
                f.write(data)
                show_progress(dl, 1, total_length)

else:
    with open(target_file, "wb") as f:
        r = requests.get(file_url, stream=True)
        total_length = r.headers.get('content-length')

        if total_length is None: # no content length header
            f.write(r.content)
        else:
            dl = 0
            total_length = int(total_length)
            for data in r.iter_content(chunk_size=4096):
                dl += len(data)
                f.write(data)
                show_progress(dl, 1, total_length)
