# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=origin-client-bin
pkgver=1.5.1
_hash=7b451fc
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source_x86_64=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")

sha256sums_x86_64=("1e5f73098c3e3bf6f887c8678c078f650e62c477eca255c0f131d6b6be805c6c")

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
