# FLA.SH

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=fla.sh
pkgver=1.2
pkgrel=1
pkgdesc='Flashcards in your terminal.'
arch=('any')
url='https://github.com/tallguyjenks/fla.sh'
license=('MIT')
provides=('flash')
conflicts=('flash-git')
depends=('bash' 'fzf' 'bat')
source=("https://github.com/tallguyjenks/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('26295cf2cad71e537b5bc551c071581853e2d2ecbb0dca9a5c64f7f36bc2a790')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 flash "$pkgdir/usr/bin/flash"
}

