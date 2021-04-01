## Curl HTTP3 - quiche version

### Ref

https://github.com/curl/curl/blob/master/docs/HTTP3.md#quiche-version

https://aur.archlinux.org/packages/curl-http3/

### Dev

```
sudo pacman -S git
git clone git@github.com:vkill/archlinux-package-curl-quiche-http3.git
cd archlinux-package-curl-quiche-http3

sudo pacman -S base-devel

sudo pacman -S rustup
rustup install stable
# or
sudo pacman -S rust

sudo pacman -S cmake

gpg --recv-keys 5CC908FDB71E12C2

rm -rf src/
rm -rf *.tar.*
rm -rf pkg/

makepkg -f

ldd pkg/curl-quiche-http3/usr/bin/curl-quiche-http3
pkg/curl-quiche-http3/usr/bin/curl-quiche-http3 --http3 https://quic.aiortc.org/ -v
```

### Publish

```
makepkg --printsrcinfo > .SRCINFO
```
