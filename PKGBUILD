# Maintainer: David Birks <david@tellus.space>
# Contributor: David Stark <david@starkers.org>

pkgver=0.102
pkgrel=2
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('f5b5a7da8504dbfdcee9c25baaad3c9c06671a483918245391400e2ed20885e0')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'kubectl' 'socat' 'sshfs' 'torsocks' 'python' 'python-pip' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
