# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.22.3
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/$pkgver/openshift-install-linux-$pkgver.tar.gz")
b2sums=('646ce8d82176499bf73ff3b0471f97121c806d1c787c1f4ffacfdd9c2e7fc2c231eb06ea4ab3ddc40ff97e8a8cd0c73ab29bb23227d5cbe6da8aa6743bbdbc89')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
