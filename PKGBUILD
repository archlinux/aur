# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.20.3
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('931e640628df8be62b20cbed0a3e2401615271e02d009a76fbc2944714d0a7897840041c4648954dd792863034c6e39a521e4a354d6376558f007ded7c9dec9a')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
