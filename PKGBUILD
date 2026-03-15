# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=openshift-install
pkgver=4.21.4
pkgrel=1
pkgdesc="Install an OpenShift 4.x cluster"
arch=("x86_64")
url="https://github.com/openshift/installer"
license=("Apache-2.0")
depends=(
    'glibc'
)
source=("$pkgname-$pkgver.tar.gz::https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux-$pkgver.tar.gz")
b2sums=('ab2629f349ef2c2933c9fa0c04124241ccb067736b63f06af4325883e1988b64447ea730203f428f46763252b7323e732f9c581ce25780c1d42748da05fd2ad0')

package() {
    install -vDm755 -t "${pkgdir}/usr/bin/" openshift-install
}
