# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=origin-client-bin
pkgver=1.5.0
_hash=031cbe4
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source_x86_64=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")
source_i686=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-32bit.tar.gz")

sha256sums_x86_64=("e928067175be0e8a5947c21ebbbf1359687846749e83411b7cd0b99759968605")
sha256sums_i686=("7100e3c9324ddb31cd0bee1c0bc74d11f79aa580f7c8776eba321094029503ab")

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
