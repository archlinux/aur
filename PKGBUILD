# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-binstruct
pkgver=17.a44d13f
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Jokymon/binstruct"
license=('GPL3')
depends=()
source=("$pkgname"::'git://github.com/Jokymon/binstruct#branch=master')
md5sums=('SKIP')
#install=.install

pkgver() {
    cd ${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/${pkgname}/"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
