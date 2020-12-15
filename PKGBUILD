# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=antidot-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
arch=("x86_64")
url="https://github.com/doron-cohen/antidot"
license=('MIT')
provides=('antidot')
conflicts=('antidot')
source=("${pkgname}-$pkgver.bin::$url/releases/download/v0.4.1/antidot-linux-amd64")
sha256sums=('285fcd30e7a752ba596f9bbde2693a6e9fd7ac28283d4f10a06c900055b48128')

package() {
	install -Dm 0755 "$srcdir/${pkgname}-$pkgver.bin" "$pkgdir/usr/bin/antidot"
}
