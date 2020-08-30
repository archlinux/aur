# Maintainer: David Birks <david@birks.dev>
# Contributor: David Stark <david@starkers.org>

pkgver=0.107
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('1305de19ad6d99c2d8efc2edfaac18ddfb3483a3ee9b89e58e17abb21baec67c')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'kubectl' 'socat' 'sshfs' 'torsocks' 'python' 'python-pip' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
