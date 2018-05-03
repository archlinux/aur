# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-bencoder-pyx
_name=bencoder.pyx
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line tool for creating new torrents, magnet URIs, editing and displaying metainfo"
arch=('any')
url="https://github.com/whtsky/bencoder.pyx"
license=('MIT')
groups=()
depends=()
makedepends=('cython')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/whtsky/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('f8bbd185c081eef2d63500188a7c1f96')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
