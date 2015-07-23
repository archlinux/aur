# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-evergreen
pkgver=0.2.0
pkgrel=1
pkgdesc="Cooperative i/o and multitasking for Python"
arch=('any')
url="https://github.com/saghul/evergreen"
license=("custom:MIT")
depends=('python2' 'python2-pyuv' 'python2-greenlet')
source=("https://github.com/saghul/evergreen/archive/release-$pkgver.tar.gz")

package() {
  cd "$srcdir/evergreen-release-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('850b072c0465dfd383e9ef65bfae93d8')
