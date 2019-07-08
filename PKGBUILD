# Maintainer: David Birks <david@tellus.space>
# Contributor: David Stark <david@starkers.org>

pkgver=0.101
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('5aa120fbc13ef6f9404f2809e534f13378a741559bdf9a318ca89a7d7225e4d1')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'socat' 'sshfs' 'torsocks' 'python' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
