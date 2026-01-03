# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.20.8
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('3f3b97aca504da886ee5e634fa39e4e25df9cd68a53eeb69fa8cbf2978faca5d9cc04bd2e7cb3d0198b39b25f72dba4ad1d7132be85287306ad940f5bd1e3c93')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
