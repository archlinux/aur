# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-torf
_name=torf
pkgver=1.3
pkgrel=3
pkgdesc="Python module to create, parse and edit torrent files and magnet links"
arch=('any')
url="https://github.com/rndusr/torf"
license=('MIT')
groups=()
depends=('python-bencoder-pyx')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$_name-$pkgver.tar.gz::https://github.com/rndusr/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('6bb2f502f97182bbcb18cad790f64da8')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
