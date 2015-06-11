# Maintainer: Larry Hajali <larryhaja[at]gmail[dot]com>

pkgname=python2-dargparse
pkgver=0.2.5
pkgrel=1
pkgdesc="Declarative command-line argument parser for python"
arch=('i686' 'x86_64')
url="https://github.com/objectlabs/dargparse"
license=('MIT')
depends=('python2>=2.7')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/d/dargparse/dargparse-${pkgver}.tar.gz")
#md5sums=('0e0efe48527258917b71d29d2a99ba0e')
sha256sums=('f66cb60f1f2d3b4456fae5f6842dfb764e98139195db3bcc58f1d9ed01c877a6')

package() {
  cd "${srcdir}/dargparse-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
