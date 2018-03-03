# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=python-plexapi
pkgver=3.0.6
pkgrel=1
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/pkkid/python-plexapi"
license=('BSD')
depends=()
makedepends=()
source=("$pkgname"::"git://github.com/pkkid/python-plexapi.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$pkgname"
    python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
