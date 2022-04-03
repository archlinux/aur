# Maintainer: Nicolas Granger <nicolas.granger@gmail.com>

pkgname=pyghmi
pkgver=1.5.36
pkgrel=1
pkgdesc="Python General Hardware Management Initiative (IPMI and others)"
arch=('any')
url="https://opendev.org/x/pyghmi"
license=('Apache')
depends=()
makedepends=('python-setuptools' 'python-wheel' 'python-pip' 'python-pbr')
source=("git+https://opendev.org/x/pyghmi#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd pyghmi

  python setup.py install --root="$pkgdir"  --optimize=1
}
