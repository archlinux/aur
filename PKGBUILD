# Maintainer: Nick Spurry <nick at spurry family .net>
pkgname=smos-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="The tool that manages your stress and workload"
arch=('x86_64')
url="https://smos.cs-syd.eu/"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://docs.smos.online/assets/smos-release.zip")
#sha256sums=('f1cd3136aef464c7e16d9b1bbd9aa65e799e9d6d64d7a234e51ed313c5b9ac2d')
sha256sums=('82bb258ba1c8d99b97c861a478bd221e2390929bc333291d712a2af7b6d79cf7')
provides=('smos')
package() {
	mkdir $pkgdir/usr
	cp -r $srcdir/bin $pkgdir/usr
	cp -r $srcdir/share $pkgdir/usr
	chmod -R 755 $pkgdir/usr
}
