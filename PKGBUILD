# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=1.8.2
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=('x86_64')
license=('ISC')
url='https://github.com/klange/bim'
depends=('gcc')
source=("https://github.com/klange/bim/archive/v${pkgver}.tar.gz")
sha256sums=('9497764e60e9476bf74cf74764abc743f49473d677e32739621d09f1cca69bad')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	make DESTDIR=${pkgdir} install
}
