# Maintainer: Nicolas Granger <nicolas.granger.m@gmail.com>

pkgname=virtualbmc
pkgver=3.0.1
pkgrel=1
pkgdesc="A virtual BMC for controlling virtual machines using IPMI commands"
arch=('any')
url="https://opendev.org/openstack/virtualbmc"
license=('Apache')
depends=('libvirt-python>=6.0.0' 'pyghmi>=1.2.0' 'python-cliff>2.9.0' 'python-pyzmq>=19.0.0' 'python-pbr>2.1.0')
makedepends=('python-setuptools' 'python-wheel' 'python-pip' 'python-pbr' )
source=("git+https://opendev.org/openstack/virtualbmc.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd virtualbmc

  python setup.py install --root="$pkgdir" --optimize=1
}
