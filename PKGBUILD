# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.7.0
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
b2sums_x86_64=('d99eaa8b2d38f0cd25fd4e9744e3597a8dac980440c73eaaa3869731c279bf0a80d75802e91f2e90742b5c1b28c2f59c3e952d2339de906a1ed5f1f86a71cb42')
b2sums_aarch64=('157465650b4679077b43488c858125979b53be16b26402590a9ba65aa3c954082fd677dfd747a36aa02d0323960fdc587076067f5c67ee660af897d242da293d')
b2sums_armv7h=('58a54e88644e0de5be828f4725c4d55b5d61dad5d228229a7a9d90f88e7a88a2ff5c94da3ced35b14f462511ed4e0a11307651e3b7e2e4cc85437e7911400957')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
