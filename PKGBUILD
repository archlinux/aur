# FLA.SH

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=fla.sh
pkgver=1.1
pkgrel=1
pkgdesc='Flashcards in your terminal.'
arch=('any')
url='https://github.com/tallguyjenks/fla.sh'
license=('MIT')
provides=('flash')
conflicts=('flash-git')
depends=('bash' 'fzf' 'bat')
source=("https://github.com/tallguyjenks/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bf3aa59a3984f52ff4a08b23d901d1b72e3b0948d8b985e6684b0dd4867e8263')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 flash "$pkgdir/usr/bin/flash"
}

