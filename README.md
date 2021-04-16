# tgr - Torified GPG Refresh
A simple privacy-minded bash utility to refresh GPG keys randomly and on a randomised timer over changing TOR circuits.

Depends on `bash`, `tor` and `torsocks`.

# Usage
This utility is a simple 1-file bash script. The script can still be run if `tor` isn't currently running, and it will periodically recheck the `tor` status and process GPG keys when it is.

A systemd user service is also included to have the file run in the background. Copy the service file to `/etc/systemd/user`. The service can then be enabled and started with `systemctl --user enable --now tgr.service`. When using the systemd service, attempted refreshes, including the key fingerprint, are logged to the journal.

Arch users can get `tgr` from the AUR, or use the included PKGBUILD to create the package as follows:

    git clone https://github.com/aeryxium/gpgrefresh.git
    cd gpgrefresh
    makepkg -si

# How it works
`tgr` has a very simple model:

1. Get a list of all public key fingerprints in your keyring and randomise them;
2. Take the first key from the list, and attempt to refresh it over an isolated tor socket; and
3. Once all keys have been refreshed, generate and randomise the list again and start over.

There are a few notes on this you should be aware of:
* If `tor` is not available when an attempt to refresh a key is made, the application will wait a randimosed period of time;
* If a key fails to be refreshed, the application will wait a randimosed period of time;
  * In both cases, the randomised time period will be somewhere between 15 and 45 minutes;
* Keys that fail to be refreshed will be attempted a total of 3 times before moving on;
* Only your public keys are checked; and
* All subkeys are refreshed with your master keys, so subkeys aren't refreshed separately.
