# Maintainer: mike2208

pkgbase='python-tinyrpc'
pkgname=('python-tinyrpc' 'python2-tinyrpc')
pkgver=0.5
pkgrel=0
pkgdesc="zip archive generator for streaming purposes"
arch=(any)
url="https://github.com/mbr/${pkgbase}"
license=('GPL3')
groups=()
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgbase}.tar.gz::https://github.com/mbr/tinyrpc/archive/${pkgver}.tar.gz")
md5sums=('4322dba8d64dbab90af6228e47cf88dc')
sha256sums=('07e70208955b711952601162c33a9a300a4420893e8741b9eec16c239e1ea2f8')

package_python-tinyrpc() {
      cd "$srcdir/tinyrpc-${pkgver}"
      python setup.py install --root="$pkgdir/" --optimize=1
    }

package_python2-tinyrpc() {
      cd "$srcdir/tinyrpc-${pkgver}"
      python2 setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:
