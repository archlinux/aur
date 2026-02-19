# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.21.1
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('650e4b13e4db3cfcc2fe47da6c38293f2d32baac79fc8fb429adb5f5a7a7f99c9a29bfc8c47de4435778797d492ba527b7fed7aa27b0dd0e291d86a0c88bbafe')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
