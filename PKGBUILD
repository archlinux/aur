# Maintainer: Larry Hajali <larryhaja[at]gmail[dot]com>

pkgname=python2-dex
pkgver=0.5.5
pkgrel=1
pkgdesc="A MongoDB performance tuning tool that compares queries to the available indexes in the queried collection(s) and generates index suggestions based on simple heuristics."
arch=('i686' 'x86_64')
url="http://blog.mongolab.com/2012/06/introducing-dex-the-index-bot/"
license=('MIT')
depends=('python2>=2.7' 'python2-pymongo' 'python2-yaml' 'python2-dargparse')
source=("http://pypi.python.org/packages/source/D/Dex/Dex-${pkgver}.tar.gz")
md5sums=('0071c3b03d154d2a562e5fe9f9b0a026')

package() {
  cd "${srcdir}/Dex-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
