# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.3.8
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=(any)
url="https://keyringer.pw"
license=(GPL3)
depends=(gnupg git)
source=("git://git.sarava.org/$pkgname#tag=$pkgver")

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
