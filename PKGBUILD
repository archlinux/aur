# Maintainer: Super Bo <supernbo@gmail.com>
# Contributor: David Stark <david@starkers.org>

pkgver=0.109
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('5d848e68a423eb7a4ca495c53b85022cc15d69f21d171a82658699c4a4afb6c7')
depends=('fuse2' 'conntrack-tools' 'kubectl' 'socat' 'sshfs' 'torsocks' 'python' 'python-pip' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
