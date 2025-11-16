# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.20.1
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('f5e62b6377282950fbfa17b85d627dec7b8c4fcc09147f318446a30f1788163d46b020a696fc9e15d5d3755828597e0ba6d668991f43e2c0d64f0903930e1b4c')

package() {
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}
