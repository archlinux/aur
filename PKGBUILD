# Maintainer: xsmile <sascha_r gmx de>

pkgname=('python-bittrex' 'python2-bittrex')
_pkgname=${pkgname[0]}
pkgver=0.1.3
pkgrel=1
pkgdesc='Python bindings for bittrex'
url='https://github.com/ericsomdahl/python-bittrex'
license=('MIT')
arch=('any')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('7535922b6320000db393445ae23fe52f')

package_python-bittrex() {
  depends=('python-requests')
  makedepends=('python-setuptools')

  cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_python2-bittrex() {
  depends=('python2-requests')
  makedepends=('python2-setuptools')

  cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
}
