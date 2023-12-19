# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=4.1
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
optdepends=('libnewt: text based ui of menu plugin')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('f5386762e27a88142600a4d94c204c4af361234eae19714843c50a20d0bdab1746bded70035c9878d4977ab73f26106df6ecdcd3daedcb8bea12ffdc5ae66646')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
