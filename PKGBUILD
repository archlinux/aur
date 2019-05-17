pkgname=kloud
pkgver=1.0
pkgrel=1
pkgdesc="An open source and minimalistic cloud based on Kotlin"
arch=(any)
depends=('java-runtime>=8' 'gradle')
url="https://github.com/texxme/Kloud"
license=('BSD')
source=(kloud $pkgname-$pkgver.tar.gz::https://github.com/texxme/Kloud/archive/v$pkgver.tar.gz)

build() {
    cd "$srcdir/Kloud-$pkgver"
    make
}

package() {
    cd "$srcdir/Kloud-$pkgver"
    sudo make install
}

sha1sums=('778be42080f3dc4c15cd63568718addef2557bb3'
          'f5d2b57fd6ffe844fe82b0963525c526b0952b47')
