# Maintainer: Michel Wohlert <michel.wohlert@gmail.com>

pkgname=quickerd
pkgver=1
pkgrel=1
pkgdesc='quicker way to draw an ERD!'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/0pointr/quickerd.git'
depends=()
makedepends=('git')
provides=('quickerd')
conflicts=('quickerd')
source=('git+https://github.com/0pointr/quickerd.git')
sha256sums=('SKIP')

build() {
        cd quickerd/
        make
}

package() {
        install -Dm 755 "$srcdir/quickerd/quickerd" "$pkgdir/usr/bin/quickerd"
}

