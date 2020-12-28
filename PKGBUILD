# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=okd-client-bin
pkgver=4.6.0_0
pkgrel=1
pkgdesc="Client tools for OpenShift"
arch=(x86_64)
url="https://github.com/openshift/okd"
license=('Apache')

pkgdate="2020-12-12-135354"
linuxver="4.6.0-0"

source=("https://github.com/openshift/okd/releases/download/${pkgver//_/-}.okd-${pkgdate}/openshift-install-linux-${linuxver}.okd-${pkgdate}.tar.gz")

sha256sums=('4b0f07428ba854174c58d2e38287e5402964c9a9355f6c359d1242efd0990da3')

package() {
    # package
    install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
