# Maintainer: David Birks <david@tellus.space>
# Contributor: David Stark <david@starkers.org>

pkgver=0.99
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('c4a44fa70437290437f76077c494507b1723c38512a8827996095545ba9773a3')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'socat' 'sshfs' 'torsocks')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
