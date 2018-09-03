# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=pympv
pkgname=python-pympv
pkgver=0.5.1
pkgrel=1
pkgdesc="A python wrapper for libmpv."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/marcan/pympv"
license=('GPL')
depends=('python' 'mpv')
conflicts=('python-mpv')
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/25/b8/edd4a7817e613adef1c8814ecc492744ffd243aee81dc8c45502d5f24cc1/$_realname-$pkgver.tar.gz")
sha256sums=('22c8fd947216ff93d66725b1737139253f142b41f929c6287dce17bdf358df05')

package() {
  cd $_realname-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
