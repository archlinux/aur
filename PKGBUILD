# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.19.14
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('7a4f172d3148a6fda522daf7b665cbc2442eda5f0c4fc841a31afd935157051b8f8fe66c4a4cd5b60b93f95bf42d41f30b62b7dc911852a2878fdf1cf3a0a8b6')

package() {
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 "openshift-install" "${pkgdir}/usr/bin/openshift-install"
}
