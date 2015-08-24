# Maintainer: Vic Luo <vicluo96@gmail.com>
pkgname=cppreference-devhelp
pkgver=20140827
pkgrel=1
epoch=
pkgdesc="Offline cppreference documentation for devhelp"
arch=('any')
url="http://en.cppreference.com/w/"
license=('GPL')
groups=()
depends=('devhelp')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/htfy96/cppreference-devhelp/raw/master/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('716565757597d502e6fcd9991e010581')
validpgpkeys=()



package() {
        cd "$srcdir/$pkgname-$pkgver"
        cp -R   * "${pkgdir}/"
}
