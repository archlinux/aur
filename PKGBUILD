# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-torf
_name=torf
pkgver=1.3
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('f1b2e576d7f24dbd8b5cf7aabea03ac7')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
