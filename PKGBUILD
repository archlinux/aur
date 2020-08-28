# Maintainer: David Birks <david@birks.dev>
# Contributor: David Stark <david@starkers.org>

pkgver=0.106
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('fd2423dc04060e9124b4af43137f3d5a74a425cd75386edc8588e4861a291721')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'kubectl' 'socat' 'sshfs' 'torsocks' 'python' 'python-pip' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
