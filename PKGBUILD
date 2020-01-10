# Maintainer: Jorengarenar

pkgname=css-beautify
pkgver=1.10.2
pkgrel=1
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python')
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    make install
}
