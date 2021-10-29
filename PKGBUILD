# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=2.6.1
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('f6f3201392bc6ed920f44584e15ead5f21c08793744e2021cd67cbc2e8049be52f15380004022a4a9bdf65cde9a0a50a5cfa74fb2b0fe6fbdd818b80cdf4f69e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
