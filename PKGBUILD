# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=oc4-bin
pkgver=4.6.16
pkgrel=1
pkgdesc="openshift client binary releases"
arch=("x86_64")
provides=("oc4")
url="https://github.com/openshift/oc"
license=("Apache")
depends=()

source=("https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${pkgver}/openshift-client-linux.tar.gz")

sha256sums=("af367edf30b61876b2c763958796bde30fbc99e14f83ef2e3c4e72b53eb0efcc")

package() {
  install -Dm755 "${srcdir}/oc" "${pkgdir}/usr/local/bin/oc4"
}
