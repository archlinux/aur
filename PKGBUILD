pkgname="dollarskip"
pkgver="3.1.3"
pkgrel="1"
source=(https://github.com/CleanMachine1/DollarSkip/archive/v3.1.3.tar.gz)
pkgdesc="Skip the dollar!"
arch=('any')
url="https://github.com/CleanMachine1/DollarSkip"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make' 'glibc')
build() {
    cd DollarSkip-${pkgver}
    make
}

package() {
    cd DollarSkip-${pkgver}
    make install PREFIX="/usr" DESTDIR="${pkgdir}"
}
sha256sums=('120ba7642bcef50da5f6644856810c4b13ab00b7e65b093ac84d5772a2a667f6')
