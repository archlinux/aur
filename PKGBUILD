# Maintainer: Vic Luo <vicluo96@gmail.com>
pkgname=cppreference-devhelp
pkgver=20140827
pkgrel=2
pkgdesc="Offline cppreference documentation for devhelp"
arch=('any')
url="http://en.cppreference.com/w/"
license=('CCPL:cc-by-sa ')
depends=('devhelp')
source=("https://github.com/htfy96/cppreference-devhelp/raw/master/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('716565757597d502e6fcd9991e010581')
validpgpkeys=()



package() {
        cd "$srcdir/$pkgname-$pkgver"
        cp -R  * "${pkgdir}/"
}
