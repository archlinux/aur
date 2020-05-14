# Maintainer: David Birks <david@birks.dev>
# Contributor: David Stark <david@starkers.org>

pkgver=0.105
pkgrel=1
pkgname=telepresence
pkgdesc='Local development against a remote Kubernetes or OpenShift cluster'
arch=('x86_64')
license=('Apache')
url='https://github.com/telepresenceio/telepresence'
source=("$pkgname-$pkgver::https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz")
sha256sums=('975a68dbf9d56625a9e1b617620a64ac5e8c23d4ac913c2fc0bc9c4e28af4d19')
makedepends=('git')
depends=('conntrack-tools' 'fuse2' 'kubectl' 'socat' 'sshfs' 'torsocks' 'python' 'python-pip' 'python-setuptools')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  env PREFIX=${pkgdir}/usr ./install.sh
}
