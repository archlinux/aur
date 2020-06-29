# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=debugpy
pkgname=python-$_pkgname
pkgver=1.0.0b12
pkgrel=1
pkgdesc="A debugger for Python used with Visual Studio and Visual Studio Code"
url="https://github.com/microsoft/$_pkgname"
license=("MIT")
arch=("x86_64")
depends=("python>=3.5")
makedepends=("python-pip")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('48a359e7e6ee0ec2579f76c4fe816632edb9c922')

package() {
  cd $_pkgname-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" \
    --ignore-installed --no-deps .
}

# vim:set ts=2 sw=2 et:
