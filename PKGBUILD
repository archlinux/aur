# Maintainer: ber532k <ber532k@gmx.de>
pkgname=mkpdf
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple wrapper around pandoc and latexmk"
arch=('any')
url="https://github.com/ber532k/mkpdf"
license=('GPL3')
depends=('texlive-core' 'biber' 'pandoc')
source=("https://github.com/ber532k/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6a94850578a210b2c21da576b382f694')

package() {
	mkdir -p $pkgdir/usr/bin
	install -m755 $pkgname-$pkgver/mkpdf $pkgdir/usr/bin
}
