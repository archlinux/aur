# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.19.4
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('a1fbc5812d9df16619aba869610c91383d12c697472c79ef974d27a65f5d4644749c535d2d530b40273570e3c6fd62d4b2794ce013d128bb25610de7e34ba5c4')

package() {
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}
