Source for the
[Nanex NxCore](http://nanex.net/)
AUR package
[libnx](https://aur.archlinux.org/packages/libnx/).

Build and Test
--------------
If you'd like to try out changes to the package, these commands offer a start:

```
rm -rf pkg src *.xz && makepkg -f
namcap -m *.xz
sudo pacman -U *.xz
rm -f *.gz && mkaurball
burp -c lib *.src.tar.gz
```
