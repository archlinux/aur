# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=origin-client-bin
pkgver=1.4.1
_hash=3f9807a
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source_x86_64=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")
source_i686=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-32bit.tar.gz")

sha256sums_x86_64=("c2ac117e85a968c4d16d5657a31dce0715dcbfa4ab4a7bc49e5c6fd7caffb7da")
sha256sums_i686=("51d57a891ec7f7ef8c5fca9eef99971a1caaa4e82892e1675f402724e1a9f6c6")

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
