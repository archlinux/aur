# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-strict-rfc3339
pkgver=0.7
pkgrel=9
pkgdesc="Strict, simple, lightweight RFC3339 functions"
url="http://www.danielrichman.co.uk/libraries/strict-rfc3339.html"
license=('GPL')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/s/strict-rfc3339/strict-rfc3339-$pkgver.tar.gz")
sha512sums=('94a2992a9ea41b75527348f0f8dae1d118d57b0764122f874baa85f5e3b523beb219ed83c2d7224725e504cd3737a6bde485957135856dcde470f32675e44e77')

build() {
  cd strict-rfc3339-$pkgver
  python3.8 setup.py build
}

package() {
  cd strict-rfc3339-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
