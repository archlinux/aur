# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

_pkgname=pychromecast
pkgname=python-pychromecast
pkgver=0.8.1
pkgrel=1
pkgdesc='Library for Python 2 and 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python-protobuf' 'python-requests' 'python-zeroconf')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('95657aff6989ba2d3723f3f85866183ece45860be4c04dac83b073720ca90d827133e2f81dab1e3149a82dd6f8e69e9bfd562be43c157202330d057685d8356b')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
