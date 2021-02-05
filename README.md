


#### Creating the `swcdb-pam-max-retries` Package

* Clone the package from AUR:
```
git clone https://aur.archlinux.org/swcdb-pam-max-retries.git;
```


* Configure, Build and Create the Package:
```
# while at the folder of `PKGBUILD`
cd swcdb-pam-max-retries;
chmod -R 777 ./;

sudo -u swcdb_builder makepkg --printsrcinfo > .SRCINFO;
sudo -u swcdb_builder makepkg -s -r;

# Install
sudo -u swcdb_builder makepkg -i;
```
