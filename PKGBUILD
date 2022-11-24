# Maintainer: asamk <asamk@gmx.de>
# Contributor: Max Harmathy <max.harmathy@web.de>
pkgname=python-stashy
pkgver=0.8
_pkgver=a1e6159344e384a849feab5c0279ee9d6fe04210
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
source=(${url}/archive/${_pkgver}.tar.gz)
sha256sums=('547a2ac6d50653b77dd10349651497a97ef0ea0d153570c234a45d367110f7cd')

package() {
  cd "$srcdir/stashy-$_pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

