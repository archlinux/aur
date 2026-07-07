import requests
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

if "bricscad.octave.com" in file_url:
    if 'fr' in locale.getlocale()[0]:
        print("Veuillez entrer votre nom d'utilisateur/email Bricsys avec votre mot de passe pour télécharger le fichier source")
    else:
        print("Please provide your Bricsys username/email along with your password to download the source file")
    _username = input("Username or email: ")
    _password = getpass.getpass()

    s = requests.session()
    
    # Keycloak login
    url = 'https://auth.bricsys.com/auth/realms/bricsys-account/protocol/openid-connect/token'

    payload = {
    'client_id': 'bricsys-website',
    'username': _username,
    'password': _password,
    'grant_type': 'password'
    }

    response = s.post(url, data=payload)
    
    try:
        access_token = response.json()['access_token']
    except IndexError:
        if 'fr' in locale.getlocale()[0]:
            print("Mauvais identifiants Bricsys !")
        else:
            print("Wrong Bricsys credentials !")
        exit(1)
    
    # Get signed url
    headers = {
        'Authorization': f'Bearer {access_token}',
        'User-Agent': 'Mozilla/5.0'
    }

    r = s.get(f"https://api.bricsys.com/installset/file/{version_number}&os={os_number}", headers = headers)
    rj = r.json()
    _su = rj['installsets'][0]['files'][0]['signedUrl']

    # Download file
    with open(target_file, "wb") as f:
        r = s.get(_su, headers = {'User-Agent': 'Mozilla/5.0', 'Referer': 'https://www.bricsys.com'}, stream = True)
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
