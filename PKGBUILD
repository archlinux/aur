# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=ptvsd
pkgname=python-$_pkgname
pkgver=4.3.2
pkgrel=3
pkgdesc="Python debugger package for use with Visual Studio and Visual Studio Code"
url="https://github.com/microsoft/$_pkgname"
license=("MIT")
arch=("x86_64")
depends=("python>=3.4")
makedepends=("python-pip")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('0ea052d12c5f78e676194c8ef3a476fe76d29ea8')

package() {
  cd $_pkgname-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" \
    --ignore-installed --no-deps .
}

# vim:set ts=2 sw=2 et:
