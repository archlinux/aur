# Maintainer: William Gathoye <william at gathoye dot be>

pkgname=ttf2eot
pkgver=0.0.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utility to convert TTF files to EOT"
url="https://github.com/wget/ttf2eot"
license=('GPL')
depends=()
makedepends=()
source=(
    https://github.com/wget/$pkgname/archive/v$pkgver.tar.gz
)
sha512sums=(
    d926d856bd3bf363919c0b0bf382527fc58d4cd7291d27b4ed44e1feabcc2353c4aa0ffb4376f0c6890a8d9c35d3c4db4357ce94af6dcf64223168731c9fc263
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/bin/"
    cp ttf2eot "$pkgdir/usr/bin/"
}
