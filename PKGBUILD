# Maintainer: Joffrey <j-off@live.fr>

pkgname='seafile-helper'
pkgver=0.1.2
pkgrel=1
pkgdesc='Seafile-server and seahub helper for upgrade and deployment'
arch=('any')
url='https://gitlab.com/J0ffrey/seafile-helper'
license=('GPL3')
depends=('python-setuptools' 'seahub')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('38215c861c885316361118cc7ad7f37cf0f4576f7961c87b2ac63223c30e1133')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
