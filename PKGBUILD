# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=halofetch-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="System information fetch with centered logos, panels and a live monitor"
arch=('x86_64')
url="https://github.com/mafuzyk/halofetch"
license=('GPL-3.0-or-later')
provides=('halofetch')
conflicts=('halofetch')
optdepends=('wireless_tools: show the Wi-Fi network name')
source=("$url/releases/download/v$pkgver/halofetch-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('d9733499dde831633254519fa7ca06c6aece97644aa6ceff6798f9ef7fb5ae9d')

package() {
  install -Dm755 "$srcdir/halofetch" "$pkgdir/usr/bin/halofetch"
}
