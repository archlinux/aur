# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=origin-client-bin
pkgver=1.3.0
_hash=3ab7af3d097b57f933eccef684a714f2368804e7
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source_x86_64=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")
source_i686=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-32bit.tar.gz")

sha256sums_x86_64=("0d3b632fae9bc2747caee2dae7970865097a4bc1d83b84afb31de1c05b356054")
sha256sums_i686=("05c83a3337ab995bad24b7359b876a3d2d3bdbdf09cc40949835c52d2fc0c659")

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
