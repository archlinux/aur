Source for the
[statsd-cpp](https://github.com/euskadi31/statsd-cpp)
AUR package
[libstatsd-cpp](https://aur.archlinux.org/packages/libstatsd-cpp/).

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
