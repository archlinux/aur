# Maintainer: robertfoster
# Contributor: boosterdev@linuxmail.org

_pkgname=validictory
pkgname=python2-$_pkgname
pkgver=1.1.2
pkgrel=1
pkgdesc="General purpose python data validator"
arch=('any')
url="https://github.com/jamesturk/validictory"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamesturk/$_pkgname/archive/$pkgver.tar.gz")

package() {
    cd "${_pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('8440c2550e61b4cce3d5155e45e51dca')
