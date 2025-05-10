# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.18.11
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("any")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('96f31990b9dc4dc9096a5903c30c4ad225fd51cf3a7de3c78584a465fa8e233c5c8938825d2ba75a0e57f6ab5634659a4f00f46f88768791e40799d7bbdba266')

package() {
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}
