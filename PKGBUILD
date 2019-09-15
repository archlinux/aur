# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=2.1.0
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=('x86_64')
license=('ISC')
url='https://github.com/klange/bim'
depends=('gcc')
source=("https://github.com/klange/bim/archive/v${pkgver}.tar.gz")
sha256sums=('c67b8bd79b890a15a2986a5c8e7409de8a58aee612f39938783830b9141dd43a')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	make DESTDIR=${pkgdir} install
}
