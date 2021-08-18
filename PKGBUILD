# Maintainer: Max Harmathy <max.harmathy@web.de>
pkgname=python-stashy
pkgver=0.6
pkgrel=1
pkgdesc="Python API client for the Atlassian Stash REST API"
arch=('any')
url="https://github.com/cosmin/stashy"
license=('APACHE2')
makedepends=(
  python-mock
)
depends=(
  python-requests
  python-decorator
)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('eec3c4771347f620e9a7957ce8ab8b44d3a74ad9dcb9280ac6c8305e017adfe4')

package() {
  cd "$srcdir/stashy-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

