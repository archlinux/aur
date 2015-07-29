#Maintainer: Benoît Taine <ork@olol.eu>
pkgname=hammer
pkgver=1.0.0_rc3
pkgrel=1
pkgdesc="The Hammer parsing library"
arch=('x86' 'x86_64')
url="https://github.com/UpstandingHackers/hammer"
license=('GPL')
makedepends=('scons')
source=("https://github.com/UpstandingHackers/hammer/archive/v${pkgver/_/-}.tar.gz")
md5sums=('04f41e8e3d915deef730f654dc61f429')

build() {
    cd "$pkgname-${pkgver/_/-}"

    scons
}

package() {
    cd "$pkgname-${pkgver/_/-}"

    scons install prefix="$pkgdir/usr/"
}
