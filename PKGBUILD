# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=origin-client-bin
pkgver=3.6.0
_hash=c4dd4cf
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source=("https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")

sha256sums=("ecb0f52560ac766331052a0052b1de646011247f637c15063f4d74432e1ce389")

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
