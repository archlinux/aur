# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-sourceinspect
pkgver=0.0.3
pkgrel=2
pkgdesc='Unified inspector for retrieving sources from Python objects'
arch=(any)
url='https://github.com/taichi-dev/sourceinspect'
license=(unknown)
makedepends=(git python-setuptools)
source=("git+$url#commit=2532324e7a1d33d6ead12ab03de7834d4a74eac9") # tag: v0.0.3
b2sums=('SKIP')

build() {
  cd sourceinspect
  python setup.py build
}

package() {
  cd sourceinspect
  python setup.py install --root="$pkgdir" --optimize=1
}
