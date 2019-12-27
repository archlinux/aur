# Maintainer: Erik Moldtmann <erik@moldtmann.de>
pkgname=rapidfire-updater
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="Update tool for the ImmersionRC RapidFire Module"
arch=(x86_64)
url="https://www.immersionrc.com/fpv-products/rapidfire/"
license=('proprietary')
install=$pkgname.install
source=("${pkgname}_${pkgver}_amd64.deb.gz::https://www.immersionrc.com/?download=5930")
md5sums=("243091a1485b22a66591d58d30876ae1")

prepare() {
	bsdtar -xf ${srcdir}/${pkgname}_${pkgver}_amd64.deb.gz -C "${srcdir}"
}

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}
