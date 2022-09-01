# Maintainer: Qiu Wenbo <crab2313@gmail.com>

pkgname=kas
pkgver=3.1
pkgrel=1
pkgdesc="Setup tool for bitbake based projects "
arch=(any)
url="https://github.com/siemens/kas"
license=('CUSTOM')
depends=('python' 'python-yaml' 'python-distro' 'python-jsonschema' 'python-kconfiglib')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('aed4e68f7a54d499fd417786f7790eaf147026fe9d8edc9f7b4bad258a05fc5ee357578795d30bf33ab8aeff4c514320018becef4e459065dd871d71c4db4df0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
