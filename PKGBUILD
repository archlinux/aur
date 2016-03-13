# Maintainer: Meir Kriheli <mkriheli@gmail.com>
# Contributor:

pkgname=python-ruamel.yaml
_pkgname=ruamel.yaml
pkgver=0.10.12
pkgrel=3
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ruamel/yaml"
license=('MIT')
groups=('devel')
depends=('python')
makedepends=('python-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6b932474a12085f05f21b2c39d89a2a1')

package() {
      cd "$srcdir/${_pkgname}-${pkgver}"
      pip install --install-option="--prefix=$pkgdir/usr" .
}

# vim:set ts=2 sw=2 et:
