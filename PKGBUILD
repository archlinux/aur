# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.21.8
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/$pkgver/openshift-install-linux-$pkgver.tar.gz")
b2sums=('0a63f2a3f35da53fd52391d9a2fada06889de28fdb44cae1c1acb32582813922e3627ad148eff03bb1212b672a9d4a898b665695ef8e5786f188b1d252c5ce35')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
