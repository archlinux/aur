# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-torf-cli
_name=torf-cli
pkgver=1.1
pkgrel=1
pkgdesc="CLI tool for creating, reading and editing torrent files"
arch=('any')
url="https://github.com/rndusr/torf-cli"
license=('MIT')
groups=()
depends=('python-torf' 'python-bencoder-pyx')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('9cf3e21aa79d276ebf3f7812accdbd4b')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod -R a+rX ${pkgdir}
}

# vim:set ts=2 sw=2 et:
