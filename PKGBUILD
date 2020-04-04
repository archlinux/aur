# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=docker-machine-add-ssh
pkgver=1.2
pkgrel=1
pkgdesc="Adds docker-machine ssh configuration to your personal ssh
configuration"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('b2f423eef48b8bfbfb82ca75cf7830637e073169')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
