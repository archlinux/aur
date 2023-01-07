# Maintainer: DumbMahreeo < dumbmahreeo (at) duck (dot) com >
# (This email address can only receive emails, not reply to them)
pkgname=commando-bin
pkgver=0.6.0
pkgrel=5
pkgdesc='A fast, locate-like utility to search for commands in Arch Linux repos'
arch=('x86_64')
url='https://github.com/DumbMahreeo/commando'
license=('MIT')
depends=('libarchive' 'openssl-1.1')
provides=('commando')
conflicts=('commando')
source=("https://github.com/DumbMahreeo/commando/releases/download/v${pkgver}/commando-bin.gz")
sha256sums=('e06c6eaa1e8e9a0bcd0bbd15b155d3c31342de6bad2e2c1d85c489f2f98c03a2')
install='commando.install'

package() {
	cd "$srcdir"
	install -Dm755 'commando-bin' "$pkgdir/usr/bin/commando"
}
