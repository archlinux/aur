# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=0.6.1
pkgrel=1
pkgdesc=""
_name=indexed_gzip
arch=('any')
url=""
license=('ZLIB')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d65bf88fe9dc0293b8075eb0a1b1ba0d2dac0eefa9d421c412a97a3ef0ea7c43')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
