# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=halofetch-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="System information fetch with centered logos, panels and a live monitor"
arch=('x86_64')
url="https://github.com/mafuzyk/halofetch"
license=('GPL-3.0-or-later')
provides=('halofetch')
conflicts=('halofetch')
optdepends=('wireless_tools: show the Wi-Fi network name')
source=("$url/releases/download/v$pkgver/halofetch-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('58dcae9972bbb11b1f71123f5c874bbba74a072b72321885f464247330e78548')

package() {
  install -Dm755 "$srcdir/halofetch" "$pkgdir/usr/bin/halofetch"
}
