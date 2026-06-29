# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.6.0
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD-3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "nodejs-wstunnel")
source_x86_64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('b0349e4dde1ad8bb34740fe94bede2156cce8f7f06ee43d9e46717989e335a94301644b63ab0e7c44c79c64eddf9b82f0e0cd39ec0840f57ac360b8189f938de')
b2sums_aarch64=('9c9be289eab6d8b7e0427294a44f9766991ed33e2a3e93998915e2cbc1ea2f8294fe6464470ab325639362ab9cb95ce9285eba83c64ef127d9fc4423241ae936')
b2sums_armv7h=('f4e526cb27c348b207239669873ed6be97e30e0bbfb95b201f097235b84d4a4583d829e2b5f8ec125317a76a02a9da163f5ab6ac25bc7b72f035726abdf1cf29')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
