# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=2.6.3
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('7e09b2a49e92f490f0932da7c7395ff0296124bec1d345e7514bc1b26fc1e9201d4c933829f7ae1eda0f4a62ed929ac794880fa9c4e7084ba4f7534c0367243b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
