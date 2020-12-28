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

source=("https://github.com/openshift/okd/releases/download/${pkgver//_/-}.okd-${pkgdate}/openshift-client-linux-${linuxver}.okd-${pkgdate}.tar.gz")

sha256sums=('7949f33d6e671c98859ab4a13908f341a69430f030643d6ebce43425151bd559')

package() {
    # package
    install -D -m755 $srcdir/oc $pkgdir/usr/bin/oc
}
