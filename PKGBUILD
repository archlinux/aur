# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-torf-cli
_name=torf-cli
pkgver=1.1
pkgrel=2
pkgdesc="CLI tool for creating, reading and editing torrent files"
arch=('any')
url="https://github.com/rndusr/torf-cli"
license=('MIT')
groups=()
depends=('python-torf')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$_name-$pkgver.tar.gz::https://github.com/rndusr/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('9cf3e21aa79d276ebf3f7812accdbd4b')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
