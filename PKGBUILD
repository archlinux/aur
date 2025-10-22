# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.20.0
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('f3a21f0388cf7ccbac1dc469fe10814d9f8cd302ea82d0cbddc992573664d9abdfaa5e8edbac49bf7c2c9b49ff2de0141169307cd4a4b31d983c3b70d8128178')

package() {
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}
