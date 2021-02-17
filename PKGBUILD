# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=searchpoc
pkgver=1.0.6
pkgrel=6
pkgdesc="Search a PoC for a (or some) given CVE id"
url="https://github.com/5amu/searchpoc/"
license=('MIT')
arch=('x86_64')
depends=('python3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/5amu/searchpoc/archive/${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
