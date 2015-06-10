Source for the
[Portable C++ API for Interactive Brokers TWS](https://github.com/rudimeier/twsapi)
AUR package
[libtwsapi](https://aur.archlinux.org/packages/libtwsapi/).

Build and Test
--------------
If you'd like to try out changes to the package, these commands offer a start:

```
rm -rf pkg src *.xz && makepkg -f
sudo pacman -U *.xz
pkg-config --cflags --libs twsapi
rm -f *.gz && mkaurball
burp -c lib *.src.tar.gz
```
