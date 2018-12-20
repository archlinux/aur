# Maintainer: Joffrey <j-off@live.fr>

pkgname='seafile-helper'
pkgver=0.1.3
pkgrel=1
pkgdesc='Seafile-server and seahub helper for upgrade and deployment'
arch=('any')
url='https://gitlab.com/J0ffrey/seafile-helper'
license=('GPL3')
depends=('python-setuptools' 'seahub')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('361a4052a0b85984398503d6821d9ffc9f99e7e19d5723aa493c2aae8763f9d4')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
