# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.4.3
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD 3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('c259984c0cf9772cc50a1f7e06eee9b0654abad6199960a94a1dd8d156bd470112325a56d3fd7486e1a34d78dc0bd83524f8b67f157a71c77e1264c567b36dff')
b2sums_aarch64=('50ab4c384fc7260a2fb2e8d07ee31b102d5a094573bad4ed72991f0feff1076719e33c70e3d9f394195e34d7cf060acfed978d67d771beb8007b0f2e5d5f547d')
b2sums_armv7h=('008f8695906ff3dbf2b0ea96825a791d056ea172edf0900ddfc1b5fa1afcc635fa6bf9fc7c6c85c3d01ca32def9dd163dd8503c7b40659729fc5a4c758cec5cc')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
