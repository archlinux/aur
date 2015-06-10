Source for the
[twstools](https://github.com/rudimeier/twstools)
AUR package
[twstools](https://aur.archlinux.org/packages/twstools/).

Build and Test
--------------
If you'd like to try out changes to the package, these commands offer a start:

```
rm -rf pkg src *.xz && makepkg -f
sudo pacman -U *.xz
rm -f *.gz && mkaurball
burp -c office *.src.tar.gz
```
