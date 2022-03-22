# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=3.0.2
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('4d6502442c5343cdb492c3857d0ebbab78666fc816d6060401fb0571b1db7bda68c4f85b0dd98b683a41ef0320ddd6909081eb3c4d36e32316cfd6c9d28c886a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
