# Maintainer: Fabio Zanini <fabio.zanini _AT_ tuebingen _DOT_ mpg _DOT_ de>
pkgname=python2-pysang
pkgver="0.3.9"
pkgrel=1
pkgdesc="A Sanger chromatograph viewer."
arch=('any')
url="https://github.com/iosonofabio/pysang"
license=('Public domain')
groups=()
depends=('python2' 'python2-biopython' 'python2-matplotlib' 'python2-pyside')
makedepends=('python2-setuptools')
provides=('python2-pysang')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/iosonofabio/pysang/archive/${pkgver}.tar.gz")
md5sums=('24430da09817a9e66c54f713aff674f9')
_distname='pysang'

package() {
  cd "$srcdir/$_distname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
