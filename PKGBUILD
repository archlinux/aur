# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

_pkgname=pychromecast
pkgname=python-pychromecast
pkgver=0.8.2
pkgrel=1
pkgdesc='Library for Python 2 and 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python-protobuf' 'python-requests' 'python-zeroconf')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('72442b2a3d9742587a9f7b11b3f502a8929c07b34332dc5197b75a0da0cd8f96fb896c044454fb77c8deaaebc00891070a7c5d27568696d69252c7e4139627fb')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
