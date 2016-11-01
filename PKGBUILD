# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.3.8
pkgrel=2
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
md5sums=('ebda1afd538184fd510dcbafc11dc08a')
