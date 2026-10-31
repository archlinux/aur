# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=halofetch-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="System information fetch with centered logos, panels and a live monitor"
arch=('x86_64')
url="https://github.com/mafuzyk/halofetch"
license=('GPL-3.0-or-later')
provides=('halofetch')
conflicts=('halofetch')
optdepends=('wireless_tools: show the Wi-Fi network name')
source=("$url/releases/download/v$pkgver/halofetch-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('3ca4f337df3499ca42c4de4941a13f70d78201ca0519172734f97a061abbb163')

package() {
  install -Dm755 "$srcdir/halofetch" "$pkgdir/usr/bin/halofetch"
}
