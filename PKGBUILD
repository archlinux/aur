# Maintainer: ber532k <ber532k@gmx.de>
pkgname=mkpdf
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple wrapper around pandoc and latexmk"
arch=('any')
url="https://github.com/ber532k/mkpdf"
license=('GPL3')
depends=('texlive-core' 'biber' 'pandoc')
source=("https://github.com/ber532k/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f2739272ded67ea85095d336ea2cd16a')

package() {
	mkdir -p $pkgdir/usr/bin
	install -m755 $pkgname-$pkgver/mkpdf $pkgdir/usr/bin
	install -m755 $pkgname-$pkgver/furbishtex $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/furbishtex
	install -m644 $pkgname-$pkgver/default.sed $pkgdir/usr/share/furbishtex
}
