# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.1.6
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
b2sums_x86_64=('3e34dcf5219cd9704ab67b7e845e42a95a256de6d99d0fb6cca4ac23dea74195507982c8a236dcb0b65f006d4cc9ea224b1f87de3721952abc461a448b079db4')
b2sums_aarch64=('e1512e40697a1eb50f334844bc16049b0a4c20a52f5511acc4b62d439710736e80ad9c8adc0f1069d9dfcb93f1e354a3581ccc684d21633be2ab405d6e61a130')
b2sums_armv7h=('3af1225e1cdd8e1bbc3a88502679374f3d97261f70c0f8c6529cf5afbd3da4fc519168c8cd4b241137fd656fb8d51691376e0655458f1d1e9b2b4a733bf31f1c')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
