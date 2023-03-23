# Maintainer: Nicolas Granger <nicolas.granger.m@gmail.com>

pkgname=pyghmi
pkgver=1.5.59
pkgrel=1
pkgdesc="Python General Hardware Management Initiative (IPMI and others)"
arch=('any')
url="https://opendev.org/x/pyghmi"
license=('Apache')
depends=('python-cryptography>=2.1' 'python-dateutil>=2.8.1' 'python-six>=1.10.0' 'python-pbr')
makedepends=('python-setuptools' 'python-wheel' 'python-pip')
source=("git+https://opendev.org/x/pyghmi#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd pyghmi

  python setup.py install --root="$pkgdir" --optimize=1
}
