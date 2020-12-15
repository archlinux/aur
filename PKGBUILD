# Maintainer: Artem Filippov <artshellorok@gmail.com>

pkgname=excrypt
pkgver=0.0.2
pkgrel=1
pkgdesc="Unix AES password manager"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.com/artshellorok/xcrypt.git"
depends=('openssl' 'json-c')
makedepends=('git')
source=("git+$url")
sha1sums=('SKIP')

build() {
    cd xcrypt
    make
}
package(){
    cd xcrypt
    mkdir -p $pkgdir/usr/bin/
    install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
    install -D -m755 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

