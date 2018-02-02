# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.5.2
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=(any)
url="https://keyringer.pw"
license=(GPL3)
depends=(gnupg git)
source=("https://keyringer.pw/releases/$pkgname-$pkgver.tar.bz2"
        "https://keyringer.pw/releases/$pkgname-$pkgver.tar.bz2.asc")
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
sha256sums=('92244e572501f7c6ca0c463608f067813ee5e5b2184484eb21ece2914e78a01e'
            'SKIP')
