# Maintainer: boosterdev@linuxmail.org

_pkgname=validictory
pkgname=python2-$_pkgname
pkgver=1.1.1
pkgrel=1
pkgdesc="General purpose python data validator"
arch=('any')
url="https://github.com/jamesturk/validictory"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamesturk/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('39e07c1040f0d3adb73d0ffc93d65c38c72fad810c76789850475072335e7fb0')

package() {
    cd "${_pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
