# Maintainer: Nicolas Granger <nicolas.granger.m@gmail.com>

pkgname=virtualbmc
pkgver=2.2.1
pkgrel=1
pkgdesc="A virtual BMC for controlling virtual machines using IPMI commands"
arch=('any')
url="https://opendev.org/openstack/virtualbmc"
license=('Apache')
depends=('libvirt-python' 'pyghmi' 'python-cliff' 'python-pyzmq')
makedepends=('python-setuptools' 'python-wheel' 'python-pip' 'python-pbr' )
source=("git+https://opendev.org/openstack/virtualbmc.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd virtualbmc

  python setup.py install --root="$pkgdir"  --optimize=1
}
