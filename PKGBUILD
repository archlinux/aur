# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.5.0
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=(any)
url="https://keyringer.pw"
license=(GPL3)
depends=(gnupg git)
source=("https://keyringer.pw/releases/$pkgname-$pkgver.tar.bz2")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('1bc62b934f3160ae27948932755e4cbf')
